class User < ApplicationRecord
  has_many :projects
  has_many :routes, through: :projects

  validates_presence_of :name
  validates_presence_of :mp_id
  validates_presence_of :email
  validates_uniqueness_of :mp_id
  validates_uniqueness_of :email


  def create_new_project(mp_id)
    route = Route.find_or_create_by(mp_id: mp_id)
    self.projects.create(user_id: self.id, route_id: route.id)
  end

  def create_tree(tree)
    parent = self.create_new_project(tree[:mp_id])
    self.gen_tree(tree, parent)
    parent
  end

  def gen_tree(tree, parent)
    if tree[:children].size > 0
      tree[:children].each do |node|
        route = Route.find_or_create_by(mp_id: node[:mp_id])
        new_parent = parent.add_child(route)
        self.gen_tree(node, new_parent)
      end
    end
  end

  def get_all_parents
    self.projects.where(parent_id: 0)
  end

  def MP_KEY
    Rails.application.credentials[Rails.env.to_sym][:mountain_project][:api_key].freeze
  end

  def fetch_user
    resp = RestClient.get("#{MP_BASE_URL}/get-user?email=#{users_params[:email]}&key=#{MP_KEY}")
    JSON.parse(resp)['user']
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
