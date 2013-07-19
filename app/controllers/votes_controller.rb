class VotesController < ApplicationController
  def create
    input = params.clone
    p input
    if input[:voteType] == 'question'
      input[:voteType] = 'Question'
    elsif input[:voteType] == 'answers'
      input[:voteType] = 'Answer' 
    end  
    if params[:voteDirection] == 'upvote'
      input[:voteDirection] = 1
    else
      input[:voteDirection] = -1
    end

    if params[:voteDirection] == 'upvote'
      voteDirection = 1
    else
      voteDirection = -1
    end
    @existing_vote = Vote.where("user_id = ? AND voteable_type = ? AND voteable_id = ?", current_user.id, input[:voteType], input[:object_id])[0]
    if @existing_vote != nil && @existing_vote.value != voteDirection
      @vote = @existing_vote
      @vote.value = voteDirection
    elsif @existing_vote != nil && @existing_vote.value == voteDirection
      @vote = @existing_vote
      @vote.value = 0
    else
      @vote = Vote.new(value: voteDirection, user_id: current_user.id)
      @vote.value = voteDirection
    end

      if params[:voteType] == 'question'
        @vote.voteable = Question.find(params[:object_id])
      else
        @vote.voteable = Answer.find(params[:object_id])
      end

  
  
    if @vote.save
      if params[:voteType] == 'question'
        @vote.voteable = Question.find(params[:object_id])
        @vote.value = voteDirection
      else
        @vote.voteable = Answer.find(params[:object_id])
        @vote.value = voteDirection
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
