require 'rails_helper'

RSpec.describe Account, type: :model do
  describe "Sign up" do
    context 'with valid values' do
      let (:account) { build(:account)}
      it "is valid" do
        # user = @user
        expect(account).to be_valid
      end
    end #with valid values
  end

  describe "has associations" do
    context 'with gender' do
      let (:account) { create(:account) }

      it "is female" do
        expect(account.gender.name).to eq "female"
      end
    end

    context 'with supporting' do
      let (:account) { create(:account) }

      it "is Antlers" do
        expect(account.supporting.team).to eq "Antlers"
      end
    end
  end
  
  
end
