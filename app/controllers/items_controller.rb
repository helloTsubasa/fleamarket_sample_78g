class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy, :purchase, :pay, :done]
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_order, except: [:index, :new, :create, :show]
  before_action :set_card, only: [:purchase, :pay, :done]

  require "payjp"

  def index
    @items = Item.limit(4).includes(:images).order('created_at DESC')
  end


  def show
  end
 
  def new
    @item = Item.new
    @item.images.new
  end

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  
  def edit
  end


  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    if @item.user_seller_id == current_user
      if @item.destroy
        respond_to do |format|
          format.html { redirect_to items_url, notice: '商品が削除されました' }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to items_url, notice: '商品の削除に失敗しました' }
          format.json { head :no_content }
        end
      end
    end
  end

  def purchase
    if @item.user_buyer_id.present?
      redirect_to item_path(@item.id)
    elsif @item.user_seller_id == current_user.id
      redirect_to item_path(@item.id)
    else
      if @card.present?
        Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @default_card_information = customer.cards.retrieve(@card.card_id)
        @card_brand = @default_card_information.brand
        case @card_brand
        when "Visa"
          @card_src = "cards/visa.svg"
        when "JCB"
          @card_src = "cards/jcb.svg"
        when "MasterCard"
          @card_src = "cards/master-card.svg"
        when "American Express"
          @card_src = "cards/american_express.svg"
        when "Diners Club"
          @card_src = "cards/dinersclub.svg"
        when "Discover"
          @card_src = "cards/discover.svg"
        end
      else
        redirect_to new_card_path, alert: 'クレジットカード情報を登録してください'
      end
    end
  end

  
  def pay  #支払い処理
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    charge = Payjp::Charge.create(
    amount: @item.price,
    card: params['payjp-token'],
    customer: @card.customer_id,
    currency: 'jpy'
    )
    @item.update(user_buyer_id: current_user.id)
    redirect_to action: :done
  end
  
  def done #購入完了画面
    if @item.user_buyer_id.present?
      redirect_to item_path(@item.id)
    elsif @item.user_seller_id == current_user.id
      redirect_to item_path(@item.id)
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def set_category  
      @category_parent_array = Category.where(ancestry: nil)
    end
  
    def item_params
      params.require(:item).permit(
        :name,
        :price,
        :text,
        :status,
        :size_id,
        :shipping_fee,
        :shipping_date,
        :category_id,
        :brand_id,
        :user_buyer_id,
        images_attributes: [:image, :_destroy, :id]
      ).merge(user_seller_id: current_user.id)
    end

    def set_order
      @order = Order.find(current_user.id)
    end

    def set_card
      @card = Card.find_by(user_id: current_user.id)
    end

end
