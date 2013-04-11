class Rating < ActiveRecord::Base
  belongs_to :course, inverse_of: :ratings
  belongs_to :user, inverse_of: :ratings
  attr_accessible :score
end
