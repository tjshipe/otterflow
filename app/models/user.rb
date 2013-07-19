class User < ActiveRecord::Base
  attr_accessible :username
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
  has_many :favorites

  validates :username, presence: true, uniqueness: true
  validates_presence_of :password_hash

  require 'bcrypt'

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.order_by_karma
  	# pending
  end
end
