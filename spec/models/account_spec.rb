require 'rails_helper'

RSpec.describe Account, type: :model do
  # describe "Sign up" do
  #   context 'with valid values' do
  #     let (:account) { build(:account)}
  #     it "is valid" do
  #       # user = @user
  #       expect(account).to be_valid
  #     end
  #   end #with valid values
  # end

  # describe "has associations" do
  #   context 'with gender' do
  #     let (:account) { create(:account) }
  #
  #     it "is female" do
  #       expect(account.gender.name).to eq "female"
  #     end
  #   end
  #
  #   context 'with supporting' do
  #     let (:account) { create(:account) }
  #
  #     it "is Antlers" do
  #       expect(account.supporting.team).to eq "Antlers"
  #     end
  #   end
  # end


  # describe "Gender interests" do
  #   context 'interested in male' do
  #     it "is interested in male" do
  #       account = create(:account)
  #       expect(account.gender_interests[0].name).to eq "male"
  #     end
  #   end
  # end
  #
  # describe 'Supporting' do
  #   context 'has supporting' do
  #     it "is Antlers" do
  #       account = create(:account)
  #       expect(account.supporting.team).to eq "Antlers"
  #     end
  #   end
  # end

  # describe "follow and unfollow" do
  #   let (:account) { create(:account) }
  #   let (:another_account) { create(:account) }
  #
  #   before {
  #     male = create(:gender, name: "male")
  #     another_account.gender_id = male.id
  #     account.follow!(another_account)
  #   }
  #
  #   context 'follow and unfollow' do
  #     it "follows another account" do
  #       # account2.nickname = "another"
  #
  #       expect(account.following?(another_account)).to eq true
  #     end
  #
  #     it "unfollow another account" do
  #       account.unfollow!(another_account)
  #       expect(account.following?(another_account)).to eq false
  #     end
  #   end
  #
  #
  # end
end
