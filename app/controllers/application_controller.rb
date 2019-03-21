class ApplicationController < ActionController::API

  def MP_BASE_URL
    "https://www.mountainproject.com"
  end

  def MP_KEY
    Rails.application.credentials[Rails.env.to_sym][:mountain_project][:api_key]
  end


  # Mountain Project API Calls
  def fetch_user
    resp = RestClient.get("#{MP_BASE_URL}/get-user?email=#{users_params[:email]}&key=#{MP_KEY}")
    JSON.parse(resp)['user']

  def fetch_routes(route_ids)
    resp = RestClient.get("#{MP_BASE_URL}/get-routes?routeIds=#{route_ids}&key=#{MP_KEY}")
    JSON.parse(resp)['routes']
  end

  def fetch_ticks(user_email)
    resp = RestClient.get("#{MP_BASE_URL}/get-ticks?email=#{user_email}&key=#{MP_KEY}")
    JSON.parse(resp)['routes']
  end

  def fetch_todos(user_email)
    resp = RestClient.get("#{MP_BASE_URL}/get-to-dos?email=#{user_email}&key=#{MP_KEY}")
    JSON.parse(resp)['routes']
  end

end
