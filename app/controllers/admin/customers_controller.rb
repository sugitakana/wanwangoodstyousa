class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:notice] = "会員情報を更新しました"
       redirect_to admin_customer_path(@customer)
    else
      render 'edit'
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :introduction, :email, :is_deleted)
  end
end
