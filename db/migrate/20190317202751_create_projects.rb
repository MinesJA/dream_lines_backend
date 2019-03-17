class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :mp_id
      t.string :status
      t.integer :user_id
      t.boolean :head
      t.integer :parent_id

      t.timestamps
    end
  end
end
