class Api::V1::RoutesController < ApplicationController


  def get_routes
    route_ids = routes_params[:route_ids]
    resp = RestClient.get("#{MP_BASE_URL}/get-routes?routeIds=#{route_ids}&key=#{mp_key}")
    @routes = JSON.parse(resp)['routes']

    render json: @routes
  end

  private

  def routes_params
    params.permit(:route_ids)
  end
end
