class Project < ApplicationRecord
  belongs_to :user
  belongs_to :route

  validates_presence_of :user
  validates_presence_of :route
  validates_presence_of :status
  validates_presence_of :parent_id

  def add_child(route)
    Project.create(user_id: self.user_id, route_id: route.id, parent_id: self.id)
  end

  def add_children(children)
    children.each do |user_project|
      self.add_child(user_project)
    end
  end

  def get_children
    Project.where(parent_id: self.id)
  end

  def get_tree
    tree = {}
    tree[:node] = self

    tree[:children] = self.get_children.map do |user_proj|
      user_proj.get_tree
    end

    tree
  end

  def self.create_tree(user, tree)
    Route.find_or_create_by(tree[:mp_id])
  end

end
