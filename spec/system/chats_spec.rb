require 'rails_helper'

RSpec.describe "Chats", type: :system do
  describe 'sending message' do

    it "sent message successfully" do
      #アカウント作成
      account = create(:account)
      another_account = create(:account, nickname: "another")
      #相互フォロー
      account.follow!(another_account)
      another_account.follow!(account)

      sign_in account
      visit browse_path

      find('#message-tab').click
      find("div[data-account-id='2']").click

      expect {
        fill_in "sending", with: "testing now"
        find("#sending").send_keys :return
        sleep 1
      }.to change(Message, :count).by(1)

    end
  end
end
