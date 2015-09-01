class LinksController < ApplicationController
  before_action :set_item

  def new
    @link = @item.links.build_short_link
  end

  def create
    @link = @item.links.build(link_params)

    if @link.save
      redirect_to items_path
    else
      render :new
    end
  end

private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def link_params
    params.require(:link).permit(:label, :short_id, :salt_count)
  end

end
