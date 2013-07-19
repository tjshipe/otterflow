class VotesController < ApplicationController
  def create
    p params

    if params[:voteType] == 'question'
      @object = Question.find(params[:object_id])
    else
      @object = Answer.find(params[:object_id])
    end
    p @object.sum

    if params[:voteDirection] == 'upvote'
      voteDirection = 1
    else
      voteDirection = -1
    end
    # Need to set user_id to current user
    @vote = Vote.new(value: voteDirection, user_id: 1)

    if params[:voteType] == 'question'
      @vote.voteable = Question.find(params[:object_id])
    else
      @vote.voteable = Answer.find(params[:object_id])
    end

    if @vote.save
      if params[:voteType] == 'question'
        @vote.voteable = Question.find(params[:object_id])
      else
        @vote.voteable = Answer.find(params[:object_id])
      end
       p @vote.voteable.sum
      respond_to do |format|
        format.html do
          redirect_to @vote.voteable.question
        end
        format.json do
          render json: {:vote_count => @vote.voteable.sum}
        end
      end
    else
      render :text => "didn't work"
    end
    p @vote.voteable.sum
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
