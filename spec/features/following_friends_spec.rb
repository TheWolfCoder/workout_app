require "rails_helper"

RSpec.feature "following friends" do
  
    before do
    @john = User.create(first_name: "john", last_name: "doe", email: "john@example.com", password: "password")
    @peter = User.create(first_name: "peter", last_name: "ed", email: "peter@example.com", password: "password")
    login_as(@john)
   end
   
   scenario "if signed in succeeds" do
    visit "/"  
     
     expect(page).to have_content(@john.full_name)
     expect(page).to have_content(@peter.full_name)
     expect(page).not_to have_link("follow", :href => "/friendships?friend_id=#{@john.id}")
     
     link = "a[href='/friendships?friend_id=#{@peter.id}']"
     find(link).click
      
     expect(page).not_to have_link("follow", :href => "/friendships?friend_id=#{@peter.id}")
   end
end