# frozen_string_literal: true

# comment for rubobp to work
class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: %i[show edit update delete]

  def new
    @review = Review.new
    @buyer_id = params[:buyer_id]
    @owner_id = params[:owner_id]
    request = Request.find_by(id: params[:request_id])
    if current_user.id.to_i == @buyer_id.to_i
      request.update(reviewed_buy: 'true')
    elsif current_user.id.to_i == @owner_id.to_i
      request.update(reviewed_own: 'true')
    end
  end

  def create
    @review = Review.new(review_params)
    @review.date = DateTime.now

    if @review.save
      redirect_to reviews_index_path, notice: 'Review was successfully created.'

    else
      render reviews_new_path, notice: 'Error al hacer review!'

    end
  end

  def show; end

  def index
    @reviews = Review.all
  end

  def edit
    # @review = Review.find_by(id: params[:id])
  end

  def update
    # @review = Review.find_by(id: params[:id])
    if @review.update(review_params)
      redirect_to reviews_index_path, notice: 'Review was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @review.destroy
    redirect_to reviews_index_path, notice: 'Request was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:text, :rating, :aid, :reid)
  end
end
