class Api::V1::UsersController < ApplicationController


  def create
    mp_user = fetch_user(users_params[:email])

    if(@user)
      @user = User.create(mp_id: mp_user.id, email: users_params[:email])
      render json: @user
    else
      render json: {error: "No user found on Mountain Project"}
    end
  end


  def create_project
    user = User.find(users_params[:id])

    if(user)
      @project = user.create_new_project(mp_id: user_parms[:mp_id])
      render json: @project
    else
      render json: {error: "No user found"}
    end
  end


  def add_children
    user = User.find(users_params[:id])

    if(user)
      @step = user.add_project_children(mp_id: user_params[:mp_id], parent_id: user_params[:parent_id])
      render json: @step
    else
      render json: {error: "No user found"}
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


  def get_to_dos
    user = User.find(users_params[:id])

    if(user)
      @routes = fetch_todos(user.email)
      render json: @routes
    else
      render json: {error: "No user found in database"}
    end
  end

  private

  def users_params
    params.permit(:id, :email, :mp_id)
  end
end
