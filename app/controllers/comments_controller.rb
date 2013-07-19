class CommentsController < ApplicationController

  # before_filter :authorize

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(:text => params[:comment][:text])

    if params[:comment][:question_id]
      @comment.commentable = Question.find(params[:comment][:question_id]) # put into helper method
      question = @comment.commentable
    elsif params[:comment][:answer_id]
      @comment.commentable  = Answer.find(params[:comment][:answer_id])
      question = @comment.commentable.question
    end

    if @comment.save
      redirect_to question_url(question)
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