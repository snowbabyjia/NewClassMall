class Distribution < ActiveRecord::Base
  has_and_belongs_to_many :courses
  attr_accessible :description, :name
  validates :title, presence: true, uniqueness: true
end
