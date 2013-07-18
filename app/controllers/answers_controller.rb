class AnswersController < ApplicationController

  before_filter :authenticate #before creating/updating/destroying
  def new
    @answer = Answer.new
  end

  def create
    question = Question.find(params[:question_id])
    @answer = question.answers.new(params[:answer])

    if @answer.save
      redirect_to # question_url(@question)
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
    answer.destroy

    redirect_to # back to the question
  end

end