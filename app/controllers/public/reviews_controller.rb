class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :search, :show]
  before_action :is_matching_login_customer, only: [:edit, :update]
  
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
    @reviews = Review.order(created_at: :desc).page(params[:page]).per(8)
  end
  
  def search
    @reviews = Review.search(params[:keyword]).order(created_at: :desc)
    @reviews = @reviews.page(params[:page]).per(8)
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
    @review = Review.find(params[:id])
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
  
  def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to reviews_path
    end
  end
end
