class QuestionsController < ApplicationController

  before_filter :authorize, :only => [:edit, :update]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question.new(params[:question])

    if @question.save
      redirect_to question_url(@question)
    else
      render :new
    end
  end

  def new
    @question = Question.new
  end

  def edit
      @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update_attributes(params[:question])
      redirect_to question_url(@question)
    else
      render :edit, flash: @question.errors.full_messages #does this work? we will see...

    end
  end

  def destroy
    question = Question.find(params[:id])
    if question.answers.none?
      question.destroy
      redirect_to questions_url, notice: "You have successfully deleted your question."
    else
      redirect_to question_url(question), notice: "You are not allowed to delete questions that have been answered."
    end
  end
end
