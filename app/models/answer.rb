class Answer < ActiveRecord::Base
  attr_accessible :user_id, :text, :question_id
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  belongs_to :question
  belongs_to :user

  validates_presence_of :text

  def sum
    self.votes.inject(0) {|sum, vote| sum + vote.value}
  end
end
