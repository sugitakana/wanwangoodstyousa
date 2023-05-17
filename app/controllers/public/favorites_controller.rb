class Public::FavoritesController < ApplicationController
  before_action :set_review, only: [:create, :destroy]
  
  def create
    @favorite = Favorites.new(customer_id: current_customer.id, review_id: @review.id)
    @favorite.save
  end
  
  def destroy
    @favorite = Favorites.find_by(customer_id: current_customer.id, review_id: @review.id)
    @favorite.destroy
  end
  
  private

  def set_review
    @review = Review.find_by(params[:review_id])
  end
end
