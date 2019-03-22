class RemoveHeadFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :head, :boolean
  end
end
