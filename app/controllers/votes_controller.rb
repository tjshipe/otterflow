class VotesController < ApplicationController
  def create
    positive = params[:positive]
    vote = current_user.votes.new(:positive => positive)

    if params[:question_id]
      vote.voteable = Question.find(params[:question_id])
    elsif params[:answer_id]
      vote.voteable = Answer.find(params[:answer_id])
    end

    if vote.save
      respond_to do |format|
        format.html do
          redirect_to vote.voteable
        end
        format.json do
        end
      end
    else
      render :text => "didn't work"
    end
  end

  def destroy
  end
end