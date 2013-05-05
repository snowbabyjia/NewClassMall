class Course < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :comments, inverse_of: :course
  has_and_belongs_to_many :majors
  has_and_belongs_to_many :distributions
  has_and_belongs_to_many :professors
  
  attr_accessible :description, :ending, :starting, :title
  
  ajaxful_rateable :stars=>10, :allow_update => true
  
  searchable do
    text :title, :description
    text :comments do
      comments.map(&:content)
    end
    
    time :ending
    time :starting
  end
  
end
