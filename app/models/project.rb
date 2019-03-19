class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects

  validates :mp_id, uniqueness: true


  def get_children

    children = Project.where(parent_id: self.id)
    Node.new()
    if(children.size() > 0)
      children.map(child => child.get_children)
    else
      children
    end
  end

end
