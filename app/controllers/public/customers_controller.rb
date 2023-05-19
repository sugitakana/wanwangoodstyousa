class Public::CustomersController < ApplicationController
  before_action :set_customer, only: [:favorites]
  
  def favorites
    favorites = Favorite.where(customer_id: @customer.id).pluck(:review_id)
    @favorite_reviews = Review.find(favorites)
    @tags = Tag.all
  end
  
  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
       flash[:notice] = "登録情報を変更しました"
       redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end
  
  def confirm_withdraw
  end
  
  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def set_customer
    @customer = Customer.find(params[:id])
  end
  
  def customer_params
    params.require(:customer).permit(:name, :introduction, :email, :is_deleted)
  end
end


