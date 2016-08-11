require 'rails_helper'

RSpec.feature "A person can login", type: :feature do
  let(:password) { 'test_pass' }
  let(:user) { FactoryGirl.create(:user, password: password) }

  scenario "A person can't access the site without logging in" do
    visit user_path(user)
    expect(current_path).to eq new_session_path
  end

  scenario "A person can login" do
    visit new_session_path
    fill_in "username", with: user.username
    fill_in "password", with: password
    click_button "Login"
    expect(current_path).to eq user_path(user)
  end

  scenario "A person inputs a bad password" do
    visit new_session_path
    fill_in "username", with: user.username
    fill_in "password", with: "not_correct_password"
    click_button "Login"
    expect(current_path).to eq current_path
  end

  scenario "A person inputs a bad username" do
    visit new_session_path
    fill_in "username", with: "not_correct_username"
    fill_in "password", with: user.password
    click_button "Login"
    expect(current_path).to eq current_path
  end

  scenario "A person inputs an empty username" do
    visit new_session_path
    fill_in "username", with: ""
    fill_in "password", with: user.password
    click_button "Login"
    expect(current_path).to eq current_path
  end

  scenario "A person inputs an empty password" do
    visit new_session_path
    fill_in "username", with: user.username
    fill_in "password", with: ""
    click_button "Login"
    expect(current_path).to eq current_path
  end

end
