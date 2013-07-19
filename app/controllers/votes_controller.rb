class VotesController < ApplicationController
  def create
    p params
    if params[:voteDirection] == 'upvote'
      voteDirection = true
    else
      voteDirection = false
    end
    # Need to set user_id to current user
    @vote = Vote.new(positive: voteDirection, user_id: 1)

    if params[:voteType] == 'question'
      @vote.voteable = Question.find(params[:object_id])
    else
      @vote.voteable = Answer.find(params[:object_id])
    end
  
    

    if @vote.save
      respond_to do |format|
        format.html do
          redirect_to @vote.voteable.question
        end
        format.json do
         
        end
      end
    else
      render :text => "didn't work"
    end

    # positive = params[:positive]
    # vote = current_user.votes.new(:positive => positive)

    # if params[:question_id]
    #   vote.voteable = Question.find(params[:question_id])
    # elsif params[:answer_id]
    #   vote.voteable = Answer.find(params[:answer_id])
    # end
  end

  def destroy
  end
end
