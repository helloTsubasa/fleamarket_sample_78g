class UsersController < ApplicationController
  before_action :set_order

  def index
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def logout
  end

  def mypage
  end
  
  def destroy
  end

  def profile
  end

  def address
  end
  
  def mail_passward
  end

  def personal_data
  end

  private

    def set_order
      @order = Order.find(current_user.id)
    end
    def order_params
      params.require(:order).permit(
      # params.require(:user).permit(  だめだった
      # params.require(:orders).permit(  だめだった
      # params.require(:users).permit(  だめだった
        :family_name, 
        :first_name, 
        :family_name_kana,
        :first_name_kana,
        :zip_code,
        :city,
        :building_name,
        :phone_number,)
    end

end
