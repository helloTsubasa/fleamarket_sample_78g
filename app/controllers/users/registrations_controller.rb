class Users::RegistrationsController < Devise::RegistrationsController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @order = @user.build_order
    render :new_order
  end

  def create_order
    @user = User.new(session["devise.regist_data"]["user"])
    @order = Order.new(order_params)
    unless @order.valid?
      flash.now[:alert] = @order.errors.full_messages
      render :new_order and return
    end
    @user.build_order(@order.attributes)
    @user.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end

    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end
 
  protected

  def order_params
    params.require(:order).permit(:family_name,:first_name,:family_name_kana,:first_name_kana ,:zip_code,:prefecuture,:city,:local,:building_name,:phone_number)
  end
end
