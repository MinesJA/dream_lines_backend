class ChangeProjectIdToRouteId < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :project_id, :route_id
  end
end
