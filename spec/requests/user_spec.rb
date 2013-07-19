require 'spec_helper'

describe 'User' do

  before do
    @user = User.new(username: "user", description: "I love cats.")
    @user.password = "password"
    @user.save
    @question = Question.create(title: "What is this site for?", body: "I don't understand..", user_id: @user.id)
    visit questions_url
  end

  context "on homepage" do
    it "sees a list of questions" do
      page.should have_content "Top Questions"
    end
    it "can click on a login link" do
      click_link "Login"
      current_path.should eq new_session_path
    end
    it "can click on a question title to go to question page" do
      click_link "#{@question.title}"
      current_path.should eq question_path(@question)
    end
    it "sees the username for who created the question" do
      page.should have_content "#{@question.user.username}"
    end

  end

  context "on question page" do
    before do
      visit question_url(@question)
    end
    it "sees question title and question body" do
      page.should have_content "#{@question.title}"
      page.should have_content "#{@question.body}"
    end
  end


end
