class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects


  def create_new_project(mp_id:)
    self.projects.create(mp_id: mp_id, head: true)
  end

  def add_project_children(mp_id:, parent_id:)
    self.projects.create(parent_id: parent_id, mp_id: mp_id)
  end

end
