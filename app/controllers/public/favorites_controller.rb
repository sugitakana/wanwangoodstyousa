class Public::FavoritesController < ApplicationController
  before_action :set_review, only: [:create, :destroy]
  
  def create
    Favorite.create(customer_id: current_customer.id, review_id: @review.id)
  end
  
  def destroy
    favorite = Favorite.find_by(customer_id: current_customer.id, review_id: @review.id)
    favorite.destroy
  end
  
  private

  def set_review
    @review = Review.find_by(id: params[:review_id])
  end
end
