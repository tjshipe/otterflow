require 'spec_helper'

describe QuestionsController do
  describe 'questions#index' do
    it "does not require authentication" do
      get :index
      response.status.should eq 200
    end

    it "loads questions sorted by vote count" do
      get :index
      assigns(:questions).should eq Question.select("questions.*, count(*)").joins(:votes).group("questions.id").order("count(*) DESC").limit(20)
    end
  end

  describe 'questions#new' do
    it 'renders new question form' do
      pending
    end
  end

  describe 'questions#create' do
    it 'redirects to users question page' do
      pending
    end
  end

  describe 'questions#edit' do
    it 'renders edit question form' do
      pending
    end

    it 'requires user to be question owner to edit' do
      pending
    end
  end

  describe 'questions#update' do
    it 'redirects to users question page' do
      pending
    end
  end

  describe 'questions#show' do
    it "does not require authentication" do
      question = FactoryGirl.build(:question)
      get :show(question)
      response.status.should eq 200
    end

    it "renders question show page" do
      pending
    end

    it "loads the right question" do
      pending
    end
  end

  describe 'questions#destroy' do
    it 'redirects to users question page' do
      pending
    end
  end
end
