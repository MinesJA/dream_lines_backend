require 'rails_helper'

RSpec.describe Route, :type => :model do


  describe "Associations" do
    it { should have_many(:projects)}
    it { should have_many(:users).through(:projects)}
  end


  describe "Validations" do
    subject {
      described_class.new(mp_id: 1)
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without an mp_id" do
      subject.mp_id = nil
      expect(subject).to_not be_valid
    end

    # it "is not valid with a non-unique mp_id" do
    #   Project.new(mp_id: 1)
    #   expect(subject).to_not be_valid
    # end
  end

end
