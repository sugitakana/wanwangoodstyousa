class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
  end
  
  def confirm_withdraw
  end
  
  def withdraw
  end
  
  private
  def customer_params
    params.require(:customer).permit(:name, :introduction, :email :is_deleted)
  end
end


