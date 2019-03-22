class AddParentIdToUserProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :user_projects, :parent_id, :integer
  end
end
