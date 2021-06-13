require 'rails_helper'

RSpec.describe "Accounts", type: :system do

  # describe 'sign up account' do
  #   let (:account) { build(:account) }
  #   before do
  #     visit root_path
  #     click_link '登録'
  #   end
  #
  #   context 'with valid values' do
  #     it "signs in successfully" do
  #       fill_in "Firstname", with: account.firstname
  #       fill_in "Lastname", with: account.lastname
  #       fill_in "Nickname", with: account.nickname
  #       fill_in "Email", with: account.email
  #       fill_in "Password", with: account.password
  #       fill_in "Password confirmation", with: account.password
  #
  #       find('input[name="commit"]').click
  #       expect(page).to have_content "signed up successfully"
  #     end
  #   end
  # end
  #
  # describe 'Sign in account' do
  #   let (:account) { create(:account) }
  #   before do
  #     visit root_path
  #     click_link 'ログイン'
  #   end
  #
  #   context 'with valid values' do
  #     it "signs in successfully" do
  #       fill_in "Email", with: account.email
  #       fill_in "Password", with: account.password
  #
  #       find('input[name="commit"]').click
  #       expect(page).to have_content "Signed in successfully"
  #     end
  #   end
  # end

  # describe 'get profile page' do
  #   let (:account) { create(:account) }
  #   context 'get profile page' do
  #     it "has Profile" do
  #       sign_in account
  #       visit profile_path(account.nickname)
  #       expect(page).to have_content "Profile"
  #     end
  #   end
  # end

  # describe 'get edit profile page' do
  #   let (:account) { create(:account) }
  #   context 'get profile page' do
  #     it "has Profile" do
  #       sign_in account
  #       visit profile_path(account.nickname)
  #       visit edit_account_registration_path
  #       expect(page).to have_content "Edit Account"
  #     end
  #   end
  # end

  # describe 'before_action :authenticate_account' do
  #   let (:account) { create(:account) }
  #   it "redirects to log in page" do
  #     get browse_path
  #     expect(response).to redirect_to new_account_session_path
  #   end
  # end



end
