require 'rails_helper'

RSpec.feature "A person can register", type: :feature do

let(:user) { FactoryGirl.create(:user) }

  scenario "A person registers themself as a user" do
    
      visit new_user_path
      fill_in "Username", with: "test_user"
      fill_in "Password", with: "test_pass"
      click_button "Create User"
    user = User.last
    expect(user.username).to eq "test_user"
    expect(user.authenticate("test_pass")).to eq user
  end

end
