require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do


  # describe "POST user#create" do
  #   context "create a new user based on an mp_id" do
  #     def test_show
  #       get :show
  #       assert_equal User.find(1), assigns(:user)
  #     end
  #   end
  # end


  describe "GET user#show" do

    it "return a user based on an id" do
      assigns(:user, )
      get :show
      byebug
      assert_equal User.find(1), assigns(:user)
    end
  end


  # describe "GET user#get_ticks" do
  #   context "returns a users mp ticks" do
  #
  #     get :show
  #     assert_equal User.find(), assigns(:)
  #   end
  # end



end
