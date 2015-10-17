require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  before :each do
    @user = create :user

    sign_in(@user)
  end

  describe "GET #new" do
    it "generates an item and a short link" do
      get :new

      expect(assigns(:item)).not_to be_nil
      expect(assigns(:link).label).not_to be_blank
    end
  end

  describe "POST #create" do

    it "creates a new item for this user" do
      exercise = -> do
        post :create,
          link: FactoryGirl.attributes_for(:link),
          item: FactoryGirl.attributes_for(:item)
      end

      expect(exercise).to change(Link, :count).and change(Item, :count)

      expect(assigns(:item).user).to eq(@user)
    end
  end

end
