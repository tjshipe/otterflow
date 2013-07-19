class Vote < ActiveRecord::Base
  attr_accessible :value, :user_id
  belongs_to :user
  belongs_to :voteable, polymorphic: true
end
