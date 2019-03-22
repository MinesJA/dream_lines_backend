class RemoveParentIdFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :parent_id, :string
  end
end
