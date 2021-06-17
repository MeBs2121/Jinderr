require 'rails_helper'

RSpec.describe Room, type: :model do

  describe '#create' do
    before do
      #アカウント作成
      @account = create(:account)
      @another_account = create(:account, nickname: "another")
    end

    it "creates Room and Entry successfully" do
      @account.follow!(@another_account)
      expect{ @another_account.follow!(@account) }.to change{ Entry.count }.by(2).and change{ Room.count }.by(1)
    end

    it "has entries" do
      @account.follow!(@another_account)
      @another_account.follow!(@account)

      room = Room.first
      entries = room.entries.pluck(:id)

      expect(entries).to eq [@account.id, @another_account.id]
    end
  end

  describe '#destroy' do
    before do
      #アカウント作成
      @account = create(:account)
      @another_account = create(:account, nickname: "another")
    end

    it "is destroyed when one of the account unfollows the other" do
      @account.follow!(@another_account)
      @another_account.follow!(@account)
      expect{ @account.unfollow!(@another_account) }.to change{ Room.count }.by(-1)
    end
  end
end
