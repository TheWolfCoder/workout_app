class Like < ActiveRecord::Base
   belongs_to :exercise
   belongs_to :user
   
   validates_uniqueness_of :user, scope: :exercise
end