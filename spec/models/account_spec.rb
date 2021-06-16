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

  #follows
  let (:account) { create(:account) }
  describe '#follow' do
    before do
      sign_in account
    end

    it "follows another_account" do
      another_account = create(:account)
      account.follow!(another_account)
      result = account.following?(another_account)
      expect(result).to eq true
    end
  end

  describe '#unfollow' do
    before do
      sign_in account
    end

    it "unfollows another_account" do
      another_account = create(:account)
      account.follow!(another_account)
      result = account.following?(another_account)
      expect(result).to eq true
      account.unfollow!(another_account)

      result = account.following?(another_account)
      expect(result).to eq false

    end
  end

  describe '#matchers' do
    before do
      sign_in account
    end

    it "unfollows another_account" do
      another_account = create(:account)
      account.follow!(another_account)
      another_account.follow!(account)
      matchers = account.matchers
      expect(matchers).to include another_account
    end
  end


end
