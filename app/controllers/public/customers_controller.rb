class Public::CustomersController < ApplicationController
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
       redirect_to customers_path
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
  def customer_params
    params.require(:customer).permit(:name, :introduction, :email, :is_deleted)
  end
end


