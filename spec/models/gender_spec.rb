require 'rails_helper'

RSpec.describe Gender, type: :model do
  describe "Create Gender" do

    let (:gender) { build(:gender) }

    it "is valid" do
      expect(gender).to be_valid
    end

    it "is not valid" do
      gender.name = nil
      gender.valid?
      expect(gender.errors[:name]).to include("can't be blank")
    end
  end
  
end
