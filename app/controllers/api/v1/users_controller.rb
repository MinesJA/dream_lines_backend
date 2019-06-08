class Api::V1::UsersController < ApplicationController

  def create
    mp_user = fetch_user(users_params[:email])

    if(mp_user)
      @user = User.find_or_create_by(mp_id: mp_user.id)
      @user.update(email: users_params[:email], name: mp_user.name)
      render json: @user
    else
      render json: {error: "No user found on Mountain Project"}
    end
  end


  def show
    byebug
    # @user = User.find(user_params[:id])
    #
    # if(@user)
    #   render json: @user
    # else
    #   render json: {error: "Could not find user in database"}
    # end
  end


  def get_to_dos
    user = User.find(users_params[:id])

    if(user)
      @routes = fetch_todos(user.email)
      render json: @routes
    else
      render json: {error: "No user found in database"}
    end
  end


  def get_ticks
    user = User.find(users_params[:id])

    if(user)
      @routes = fetch_ticks(user.email)
      render json: @routes
    else
      render json: {error: "No user found in database"}
    end
  end




  private

  def users_params
    params.permit(:id, :mp_id, :email, :name)
  end
end
