class ItemsController < ApplicationController

  def index
    @items = current_user.items
  end

  def new
    @item = current_user.items.new
    @link = @item.links.build_short_link
  end

  def create
    @item = current_user.items.new(item_params)
    @link = @item.links.new(link_params)

    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

private

  def item_params
    params.require(:item).permit(:url)
  end

  def link_params
    params.require(:link).permit(:label, :short_id, :salt_count)
  end

end
