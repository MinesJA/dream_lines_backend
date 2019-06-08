class RenameProjectsTableToRoutes < ActiveRecord::Migration[5.2]
  def change
    rename_table :projects, :routes
    rename_table :user_projects, :projects
  end
end
