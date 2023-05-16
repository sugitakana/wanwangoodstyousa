class Public::FavoritesController < ApplicationController
  before_action :set_review, only: [:create, :destroy]
  
  def create
    @review = Review.find(params[:id])
    favorite = @review.favorites.new(customer_id: current_customer.id)
    favorite.save
  end
  
  def destroy
    @review = Review.find(params[:id])
    favorite = current_customer.favorites.find_by(review_id: @review.id)
    favorite.destroy
  end
  
  private

  def set_review
    @review = Review.find(params[:review_id])
  end
end
