class AnswersController < ApplicationController

  # before_filter :authenticate
  # before_filter :authorize

  def new
    @answer = Answer.new
  end

  def create
    question = Question.find(params[:question_id])
    @answer = question.answers.new(params[:answer])
    @answer.user_id = current_user.id

    if @answer.save
      redirect_to question_path(question)
    else
      render :new
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def updated
    @answer = Answer.find(params[:id])

    if @answer.update_attributes(params[:answer])
      redirect_to question
    else
      render :edit
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    question = answer.question
    answer.destroy

    redirect_to question_path(question)
  end

end