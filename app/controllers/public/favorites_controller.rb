class Public::FavoritesController < ApplicationController
  before_action :set_review, only: [:create, :destroy]

  def create
    favorite = current_customer.favorites.new(review_id: @review.id)
    favorite.save
  end

  def destroy
    favorite = current_customer.favorites.find_by(review_id: @review.id)
    favorite.destroy
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
  end
end
