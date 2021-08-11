# frozen_string_literal: true

# comment for rubobp to work
class CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update delete]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    # @comment = Comment.new
    @comment = current_user.comments.build
  end

  def create
    @comment_params = params.require(:comment).permit(:user_id, :text, :father_id, :post_id)
    # @comment = Comment.new(@comment_params)
    @comment = current_user.comments.build(@comment_params)
    @comment.date = DateTime.now

    if @comment.save
      redirect_to posts_show_path(@comment.post_id), notice: 'A new comment has been created!'
    else
      redirect_to posts_show_path(@comment.post_id), notice: 'Error!'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment_params = params.require(:comment).permit(:text)

    if @comment.update(@comment_params)
      redirect_to posts_show_path(@comment.post_id), notice: 'Comment has been edited'
    else
      redirect_to posts_show_path(@comment.post_id), notice: 'Error!'
    end
  end

  def delete
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_show_path(@comment.post_id), notice: 'Comment deleted'
  end

  def correct_user
    @comment2 = current_user.comments.find_by(id: params[:id])
    redirect_to request.referrer, notice: 'You are not Authorized' if @comment2.nil?
  end
end
