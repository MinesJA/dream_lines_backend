# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def uniq_number
  Faker::Number.unique.number(4).to_i
end



4.times do
  user = User.create(mp_id: uniq_number, email: Faker::Internet.email)

  project = user.projects.create(mp_id: uniq_number, head: true)

  4.times do
    child_one = Project.create(mp_id: uniq_number, parent_id: project.id)

    3.times do
      child_two = Project.create(mp_id: uniq_number, parent_id: child_one.id)

      2.times do
        Project.create(mp_id: uniq_number, parent_id: child_two.id)
      end
      
    end
  end
end






# t.integer "mp_id"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.string "email"


  # t.integer "mp_id"
  # t.string "status"
  # t.integer "user_id"
  # t.boolean "head", default: false
  # t.integer "parent_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
