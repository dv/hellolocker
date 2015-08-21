class LabelsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    redirect_to item.url
  end

private

  def item
    link.item
  end

  def link
    label = params[:label]

    Link.find_by(label: label)
  end

end
