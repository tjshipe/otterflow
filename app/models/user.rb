class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
  has_many :favorites

  validates :username, presence: true, uniqueness: true
  validates_presence_of :password_hash
end