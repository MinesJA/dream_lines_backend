class Api::V1::UsersController < ApplicationController


  def create
    resp = RestClient.get("#{MP_BASE_URL}/get-user?email=#{users_params[:email]}&key=#{MP_KEY}")
    @user = JSON.parse(resp)

    if(@user)
      User.create(mp_id: @user.id, email: users_params[:email])
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


  def add_steps
    user = User.find(users_params[:id])

    if(user)
      @step = user.add_project_children(mp_id: user_params[:mp_id], parent_id: user_params[:parent_id])
      render

    else

    end
  end


  def get_ticks
    byebug
    user = User.find(users_params[:id])

    if(user)
      resp = RestClient.get("#{MP_BASE_URL}/get-ticks?email=#{user.email}&key=#{MP_KEY}")
      @routes = JSON.parse(resp)['routes']

      render json: @routes
    else
      render json: {error: "No user found in database"}
    end
  end


  def get_to_dos
    user = User.find(users_params[:id])

    if(user)
      resp = RestClient.get("#{MP_BASE_URL}/get-to-dos?email=#{user.email}&key=#{MP_KEY}")
      @routes = JSON.parse(resp)['routes']

      render json: @routes
    else
      render json: {error: "No user found in database"}
    end
  end

  private

  def users_params
    params.permit(:id, :email, :mp_id, :)
  end
end
