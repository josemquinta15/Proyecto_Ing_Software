# frozen_string_literal: true

# comment for rubobp to work
class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show search find_by_category find_by_type find_by_price]
  before_action :correct_user, only: %i[edit update delete]

  def index
    @posts = Post.all
  end

  def show
    if (params[:id] == 'find_by_category') || (params[:id] == 'find_by_type') || (params[:id] == 'find_by_price')
      redirect_to posts_index_path
      return ''
    end
    @post = Post.find(params[:id])
  end

  def new
    # @post = Post.new
    @post = current_user.posts.build
  end

  def create
    @post_params = params.require(:post).permit(:text, :title, :price, :user_id, :animal, :ptype, :location, images: [])
    p @post_params
    # @post = Post.new(@post_params)
    @post = current_user.posts.build(@post_params)
    @post.date = DateTime.now
    @post.level = 1
    p @post
    if @post.save
      redirect_to posts_path, notice: 'A new post has been created!'
    else
      redirect_to posts_path, notice: 'Error!'
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post_params = params.require(:post).permit(:text, :title, :price, :animal, :ptype, :location, images: [])

    if @post.update(@post_params)
      redirect_to posts_index_path, notice: 'Post has been edited'
    else
      redirect_to posts_index_path, notice: 'Error!'
    end
  end

  def delete
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_index_path, notice: 'Post deleted'
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to posts_index_path, notice: 'You are not Authorized' if @post.nil?
  end

  def search
    search_txt = ActionController::Base.helpers.sanitize(params[:searchbar])
    selected_posts = Post.where('lower(title) LIKE ?', "%#{search_txt.downcase}%")
    @posts = selected_posts
    render 'posts/index'
  end

  def find_by_category
    category = ActionController::Base.helpers.sanitize(params[:category])
    selected_posts = Post.where(animal: category)
    @posts = selected_posts
    render 'posts/index'
  end

  def find_by_type
    type = ActionController::Base.helpers.sanitize(params[:ptype])
    selected_posts = Post.where(ptype: type)
    @posts = selected_posts
    render 'posts/index'
  end

  def find_by_price
    min_price = ActionController::Base.helpers.sanitize(params[:post][:min_price]).to_i
    max_price = ActionController::Base.helpers.sanitize(params[:post][:max_price]).to_i
    selected_posts = Post.where(price: min_price..max_price)
    @posts = selected_posts
    render 'posts/index'
  end
end
