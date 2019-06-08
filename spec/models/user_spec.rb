require 'rails_helper'

RSpec.describe User, :type => :model do


  describe "Associations" do
    it { should have_many(:projects)}
    it { should have_many(:routes).through(:projects)}
  end


  describe "Validations" do
    subject {
      described_class.new(name: "Jon", mp_id: 1, email: "jon@jon.com")
    }

    it "is valid with valid attributes" do
      subject.name = "Jon"
      subject.mp_id = 1
      subject.email = "jon@jon.com"

      expect(subject).to be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an mp_id" do
      subject.mp_id = nil
      expect(subject).to_not be_valid
    end


  end


  describe "Business Logic" do
    let(:user) {
      User.create!(name: "Jon", email: "jon@jon.com", mp_id: "123")
    }

    let!(:route_1){
      Route.create(mp_id: 123)
    }

    let(:route_2){
      Route.create(mp_id: 234)
    }

    let(:route_3){
      Route.create(mp_id: 345)
    }

    let(:route_4){
      Route.create(mp_id: 456)
    }

    describe ".create_new_project" do
      it "initializes a new route and associates with the user as a project" do
        expect(user.create_new_project(123).route_id).to eq(route_1.id)
        expect(user.create_new_project(999)).to be_a(Project)
      end
    end

    describe ".create_tree" do
      it "initializes a tree based on nested hash" do
        tree = {
          mp_id: route_1.mp_id,
          children: [
            {
              mp_id: route_2.mp_id,
              children: [
                {
                  mp_id: route_4.mp_id,
                  children: []
                }
              ]
            },
            {
              mp_id: route_3.mp_id,
              children: []
            }
          ]
        }
        
        parent_project = user.create_tree(tree)
        expect(parent_project.get_children.size()).to eq(2)
      end
    end
  end

end
