class Public::HomesController < ApplicationController

  def top
    @items = Item.where(is_active: true)
  end
end
