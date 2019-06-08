class AddDefaultParentIdToUserProject < ActiveRecord::Migration[5.2]
  def change
    change_column_default :user_projects, :parent_id, 0
  end
end
