class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def edit_menu
    @items = Item.all
  end
end
