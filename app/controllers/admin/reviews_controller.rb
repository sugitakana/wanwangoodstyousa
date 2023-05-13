class Admin::ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end
  
  def destory
  end
  
  private
  def review_params
    params.require(:review).permit(:tag_id, :item_name, :item_price, :image, :dog_breed, :review, :rate)
  end
end
