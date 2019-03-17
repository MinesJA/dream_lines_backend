class User < ApplicationRecord
  has_many :projects

  def create_new_project(mp_id)
    self.projects.create(mp_id: mp_id, head: true)
  end

  def to_dos
    https://www.mountainproject.com/data/get-to-dos?email=minesja@gmail.com&key=111320891-1dce0c8fa4b502af9a6e837e67101cc9
  end


end
