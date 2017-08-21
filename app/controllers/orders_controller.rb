class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = current_user.orders
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    session[:items_ids].each { |item| @order.items << Item.find(item) }
    @order.bill = @order.items.to_a.pluck(:price).inject(:+)


    if @order.save
      session[:items_ids] = nil
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @order.update(order_params)
    redirect_to root_path
  end

  def destroy
    @order.destroy
    redirect_to root_path
  end



  # ~~~~~~~~~~~~~~~ CART FUNCTIONS ~~~~~~~~~~~~~~~

  def add_cart
    session[:items_ids] ||= []
    session[:items_ids] << params[:item_id]
    redirect_to menu_pages_path(category: params[:category].downcase)
  end

  def remove_cart
    if session[:items_ids].include?(params[:item_id])
      session[:items_ids].delete_at(session[:items_ids].index(params[:item_id]))
      redirect_to menu_pages_path(category: params[:category])
    end
  end

  def clear_cart
    session[:items_ids] = nil
    redirect_to menu_pages_path(category: params[:category])
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:notes, :status, :bill, :address_id)
    end
end
