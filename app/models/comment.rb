class Comment < ActiveRecord::Base
  belongs_to :course, inverse_of: :comments
  belongs_to :user, inverse_of: :comments
  attr_accessible :content
  validates :content, presence: true
end
