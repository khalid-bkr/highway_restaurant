class AddressesController < ApplicationController

  before_action :set_address, only: [:edit, :update, :destroy]

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = Address.new
  end

  def create
    @address = current_user.addresses.new(address_params)
    if @address.save
      redirect_to menu_pages_path(category: "meals")
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address.destroy
    redirect_to addresses_path
  end

  private

    def address_params
      params.require(:address).permit(:city, :area, :road_name, :building_number, :apartment_number, :floor, :landmark)
    end

    def set_address
      @address = Address.find(params[:id])
    end
end
