require 'spec-helper'

describe Answer do
  it { should belong_to :user }
  it { should belong_to :question }
  it { should have_many(:comments).as(:commentable) }  
  it { should have_many(:votes).as(:voteable) }

  it { should validate_presence_of(:text) }
end
