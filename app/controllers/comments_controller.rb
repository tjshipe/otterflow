class CommentsController < ApplicationController

  before_filter :authorize

  def new
    @comment = Comment.new
  end

  def create
    if params[:question_id]
      commentable = Question.find(params[:comment_id]) # put into helper method
      url = commentable
    elsif params[:answer_id]
      commentable = Answer.find(params[:answer_id])
      url = answer.question
    end

    @comment = commentable.comments.new(params[:comment])

    if @comment.save
      redirect_to question_url(url)
    else
      render :new, notice: "Your comment was invalid."
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    if params[:question_id]
      commentable = Question.find(params[:comment_id])
      url = commentable
    elsif params[:answer_id]
      commentable = Answer.find(params[:answer_id])
      url = answer.question
    end

    @comment = Comment.find(params[:id])

    if @comment.update_attributes(params[:comment])
      redirect_to question_url(url)
    else
      render :edit
    end
  end

  def destroy
    if params[:question_id]
      commentable = Question.find(params[:comment_id])
      url = commentable
    elsif params[:answer_id]
      commentable = Answer.find(params[:answer_id])
      url = answer.question
    end

    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to question_url(url)
  end
end