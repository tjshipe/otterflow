class Comment < ActiveRecord::Base
  attr_accessible :user_id, :commentable, :text
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :text, presence: true
end
