class UsersController < ApplicationController


  def get_ticks
    user = User.find(users_params[:id])

    if(user)
      resp = RestClient.get("#{MP_BASE_URL}/get-ticks?email=#{user.email}&key=#{MP_KEY}")
      @routes = JSON.parse(resp)['routes']

      render json: @routes
    else
      render json: {error: "No user found"}
    end
  end


  def get_to_dos
    user = User.find(users_params[:id])

    if(user)
      resp = RestClient.get("#{MP_BASE_URL}/get-to-dos?email=#{user.email}&key=#{MP_KEY}")
      @routes = JSON.parse(resp)['routes']

      render json: @routes
    else
      render json: {error: "No user found"}
    end
  end

  private

  def users_params
    params.permit(:id)
  end
end
