class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :tags
  has_many :categories, through: :tags
  has_many :answers
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :body
end