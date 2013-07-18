class CommentsController < ApplicationController

  before_filter :authenticate # which pages should we authenticate?

  def new
    @comment = Comment.new
  end

  def create
    if params[:comment_id]
      commentable = Comment.find(params[:comment_id])
    elsif params[:answer_id]
      commentable = Answer.find(params[:answer_id])
    end

    @comment = commentable.comments.new(params[:comment])

    if @comment.save
      redirect_to question_url()
    else
      render :new # tell why it didn't save
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(params[:comment])
      redirect_to question_url(@question)
    else
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to question_url
  end
end