require 'rails_helper'

RSpec.feature "Users Signout" do

  before do
    @john = User.create(first_name: "john", last_name: "doe", email: "john@example.com",
    password: "password")
  end

  scenario "with valid credentials" do
    visit "/"
    
    click_link "Sign in"
    fill_in "Email", with: "john@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
  
#    scenario do
        
  #  click_link "Sign out"
 # #  expect(page).to have_content("Signed out successfully.")
   # expect(page).to_not have_content("Signed in as #{@john.email}")#
#    end
end