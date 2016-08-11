require 'rails_helper'

RSpec.feature "A new course can be added", type: :feature do

let(:user) { FactoryGirl.create(:user) }

  scenario "A person adds a new course" do

      # login to session first
      visit new_session_path
      fill_in "username", with: user.username
      fill_in "password", with: user.password
      click_button "Login"
      expect(current_path).to eq user_path(user)

      # then visit new course path
      visit new_course_path
      fill_in "Name", with: "test_name"
      fill_in "course_starts_time", with: "10:10"
      fill_in "course_ends_time", with: "11:00"
      fill_in "User", with: 1
      click_button "Create Course"
    course = Course.last
    expect(course.name).to eq "test_name"
  end
end
