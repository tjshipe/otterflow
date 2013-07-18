class Tag < ActiveRecord::Base
  attr_accessible :question_id, :category_id
  belongs_to :question
  belongs_to :category
end
