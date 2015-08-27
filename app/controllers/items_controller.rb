class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @link = generate_short_link
    @item = Item.new
  end

  def create
    @link = Link.new(link_params)
    @item = Item.new(item_params)

    @item.links << @link

    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

private

  def generate_short_link
    index = ShortLabelSequence.next
    label = LabelMaker.new.generate_short_label(salt_count: 1, index: index)

    Link.new(label: label)
  end

  def item_params
    params.require(:item).permit(:url)
  end

  def link_params
    params.require(:link).permit(:label)
  end

end
