class Route < ApplicationRecord
  has_many :projects
  has_many :users, through: :projects

  validates_presence_of :mp_id
  validates_uniqueness_of :mp_id

  def self.find_or_create(id)
    self.find_or_create_by(id: id)
  end

  # def MP_BASE_URL
  #   "https://www.mountainproject.com"
  # end

  def self.MP_KEY
    Rails.application.credentials[Rails.env.to_sym][:mountain_project][:api_key]
  end

  def self.fetch_routes(route_ids)
    resp = RestClient.get("#{MP_BASE_URL}/get-routes?routeIds=#{route_ids}&key=#{self.MP_KEY}")
    JSON.parse(resp)["routes"]
  end

end
