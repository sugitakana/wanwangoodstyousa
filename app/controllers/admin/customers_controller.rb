class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews.page(params[:page]).per(8)
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
