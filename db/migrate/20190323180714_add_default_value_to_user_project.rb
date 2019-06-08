class AddDefaultValueToUserProject < ActiveRecord::Migration[5.2]
  def change
    change_column_default :user_projects, :status, "Not Started"
  end
end
