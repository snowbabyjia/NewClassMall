class Comment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  attr_accessible :content
end
