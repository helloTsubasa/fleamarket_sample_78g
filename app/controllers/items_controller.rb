class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy,:purchase]
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_order, except: [:index, :new, :create, :show]

  def index
    @items = Item.all
  end


  def show
  end

  def purchase
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
end
