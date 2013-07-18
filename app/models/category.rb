class Category < ActiveRecord::Base
  attr_accessible :text
  has_many :tags
  has_many :questions, through: :tags
end
