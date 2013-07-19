class VotesController < ApplicationController
  def create
    if params[:voteDirection] == 'upvote'
      voteDirection = 1
    else
      voteDirection = -1
    end
    # Need to set user_id to current user
    @vote = Vote.new(value: voteDirection, user_id: current_user.id)

    if @vote.save
      if params[:voteType] == 'question'
        @vote.voteable = Question.find(params[:object_id])
      else
        @vote.voteable = Answer.find(params[:object_id])
      end
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
  end

  def destroy
  end
end
