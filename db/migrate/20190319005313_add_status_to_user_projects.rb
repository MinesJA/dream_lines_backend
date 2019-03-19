class AddStatusToUserProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :user_projects, :status, :string
  end
end
