class Course < ActiveRecord::Base
  attr_accessible :description, :ending, :starting, :title
end
