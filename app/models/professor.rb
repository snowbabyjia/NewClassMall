class Professor < ActiveRecord::Base
  has_and_belongs_to_many :courses
  attr_accessible :name
end
