class AddDefaultToHead < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :head, :boolean, :default => false
  end
end
