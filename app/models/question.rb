class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :tags
  has_many :categories, through: :tags
end