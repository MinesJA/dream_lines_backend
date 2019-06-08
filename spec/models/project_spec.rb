require 'rails_helper'

RSpec.describe Project, type: :model do


  describe "Associations" do
    it { should belong_to(:user)}
    it { should belong_to(:route)}
  end


  describe "Validations" do
    it { should validate_presence_of(:user)}
    it { should validate_presence_of(:route)}
    it { should validate_presence_of(:parent_id)}
    it { should validate_presence_of(:status)}

    it "has a default status of 'Not Started'" do
      expect(described_class.new().status).to eq("Not Started")
    end

    it "has a default parent_id of 0" do
      expect(described_class.new().parent_id).to eq(0)
    end
  end


  describe "Business Logic" do
    let(:user) {
      User.create(name: "Jon", email: "jon@jon.com", mp_id: "123")
    }

    let(:route_1){
      Route.create(mp_id: 123)
    }

    let(:route_2){
      Route.create(mp_id: 456)
    }

    let(:route_3){
      Route.create(mp_id: 789)
    }

    let(:parent_project){
      Project.create(user_id: user.id, route_id: route_1.id)
    }


    describe ".add_child" do
      it "adds a new Project child to an existing Project" do
        child_project = parent_project.add_child(route_2)

        expect(parent_project.errors).to be_empty
        expect(route_2.users).to include(user)
        expect(route_2.projects).to include(child_project)
        expect(child_project.parent_id).to equal(parent_project.id)
      end
    end

    describe ".add_children" do
      it "adds multiple children to an existing Project" do
        parent_project.add_children([route_2, route_3])

        expect(parent_project.errors).to be_empty
        expect(route_2.users).to include(user)
        expect(route_3.users).to include(user)
        expect(Project.where(parent_id: parent_project.id).length).to equal(2)
      end
    end


    describe ".get_children" do
      it "returns all children of a Project" do
        child1 = parent_project.add_child(route_2)
        child2 = parent_project.add_child(route_3)

        expect(parent_project.get_children).to include(child1, child2)
      end
    end


    describe ".get_tree" do
      it "returns tree of children" do
        child1 = parent_project.add_child(route_2)
        child2 = parent_project.add_child(route_3)

        route_4 = Route.create(mp_id: 1234)
        route_5 = Route.create(mp_id: 4567)

        child1.add_child(route_4)
        child1.add_child(route_5)

        tree = parent_project.get_tree

        expect(tree).to have_key(:node)
        expect(tree).to have_key(:children)

        expect(tree[:children].length).to equal(2)
        expect(tree[:children][0][:children].length).to equal(2)
      end
    end
  end

end
