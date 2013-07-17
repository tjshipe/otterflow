require 'spec-helper'

describe Question do
  it { should belong_to :user }
  it { should have_many :answers }
  it { should have_many :tags }
  it { should have_many(:categories).through(:tags) }
  it { should have_many(:comments).as(:commentable) }
  it { should have_many(:votes).as(:voteable) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end
