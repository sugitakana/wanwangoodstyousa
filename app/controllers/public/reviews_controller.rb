class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to review_path(@review)
    else
      render :new
    end
  end
  
  def index
    @tags = Tag.all
    @reviews = Review.all
  end
  
  def search
    @reviews = Review.search(params[:keyword])
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def review_params
    params.require(:review).permit(:item_name, :item_price, :image, :dog_breed, :review, :rate)
  end
end
