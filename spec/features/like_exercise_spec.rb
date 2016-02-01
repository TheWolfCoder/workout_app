require "rails_helper"

RSpec.feature "Like an Exercise" do
  
   before do
    @john = User.create(first_name: "john", last_name: "doe", email: "john@example.com", password: "password")
    @john_exer = @john.exercises.create(duration_in_min: 45, 
                                          workout: "Cardio Activity",
                                          workout_date: Date.today)
    
    login_as(@john)
   end
   
  
   scenario "Thumbs up" do

   visit "/"
   
   click_link "My Lounge"
   link = "a[href='/users/#{@john.id}/exercises/#{@john_exer.id}/show']"
   find(link).click   
  
   link = "a[href='/users/#{@john.id}/exercises/#{@john_exer.id}/like?like=true']"
   
   expect(page).to have_link(link)

     
   end
  
  
  
end