class Api::V1::RoutesController < ApplicationController

  def get_routes
    routes = Route.fetch_routes(routes_params[:mp_ids])
    render json: routes
  end


  private

  def routes_params
    params.permit(:id, :mp_ids)
  end
end
