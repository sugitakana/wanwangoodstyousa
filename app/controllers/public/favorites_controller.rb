class Public::FavoritesController < ApplicationController
  before_action :set_review, only: [:create, :destroy]
  
  def create
    @favorite = Favorite.new(customer_id: current_customer.id, review_id: params[:review_id])
    @favorite.save
  end
  
  def destroy
    @favorite = Favorite.find_by(customer_id: current_customer.id, review_id: params[:review_id])
    @favorite.destroy
  end
  
  private

  def set_review
    @review = Review.find(params[:review_id])
  end
end
