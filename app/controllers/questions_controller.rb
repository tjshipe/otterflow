class QuestionsController < ApplicationController

  before_filter :authenticate, :only => [:create, :update] #which page do we authenticate?

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question.new(params[:question])

    if @post.save
      redirect_to #somehwere
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def edit
      @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update_attributes(params[:question])
      redirect_to question_url(@question)
    else
      render :edit # somewhere to fix unsuccessful edit
    end
  end
end
