require 'spec_helper'

describe Answer do
  it { should belong_to :user }
  it { should belong_to :question }
  it { should have_many(:comments) }
  it { should have_many(:votes) }

  it { should validate_presence_of(:text) }
end
