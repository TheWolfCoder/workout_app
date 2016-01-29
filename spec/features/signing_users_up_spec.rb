require 'rails_helper'

RSpec.feature "Users Signup" do
  scenario "with valid credentials" do
    visit "/"
    
    click_link "Sign up"
    fill_in "user[first_name]", with: "John"
    fill_in "user[last_name]", with: "Doe"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    
    expect(page).to have_content("You have signed up successfully.")
    visit "/"
    expect(page).to have_content("John Doe")
  end
end