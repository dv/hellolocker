require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe "GET new" do
    it "generates an item and a short link" do
      get :new

      expect(assigns(:item)).not_to be_nil
      expect(assigns(:link).label).not_to be_blank
    end
  end

end
