class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end


  def dashboard
    redirect_to root_path unless current_user.admin?
  end

  def menu
    if params[:category].present?
      @items = Item.where(category: params[:category])
    else
      @items = Item.where(category: 0)
    end

    @items_list = {}
    session[:items_ids].each do |item_id|
      item = Item.find(item_id)
      @items_list[item.name] ||= {
        id: item_id.to_i,
        count: 0,
        price: item.price
      }
      @items_list[item.name][:count] += 1
    end if session[:items_ids].present?


    @bill = @items_list.values.map{|item| item[:price] * item[:count] }.inject(:+)
  end

  def manager_orders
    redirect_to root_path unless current_user.admin?
    @received_orders = Order.where(status: nil)
    @being_prepared_orders = Order.where(status: 0) || []
    @done_orders = Order.where(status: 1) || []
    @out_for_delivery_orders = Order.where(status: 2) || []
    @delivered_orders = Order.where(status: 3) || []
  end


  def edit_menu
    @items = Item.all
  end
end
