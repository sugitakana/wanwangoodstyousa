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
    @tags = Tag.all.order(created_at: :desc)
    @reviews = Review.all
  end
  
  def search
    @reviews = Review.search(params[:keyword]).order(created_at: :desc)
    @tags = Tag.all
  end
  
  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find([:id])
    if @review.update(review_params)
      flash[:notice] = "レビュー情報を更新しました"
      redirect_to review_path(@review)
    else
      render 'edit'
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end
  
  private
  def review_params
    params.require(:review).permit(:tag_id, :item_name, :item_price, :image, :dog_breed, :review, :rate)
  end
end
