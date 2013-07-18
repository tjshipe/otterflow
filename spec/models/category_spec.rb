require 'spec_helper'

describe Category do
  it { should have_many :tags }
  it { should have_many(:questions).through(:tags) }

  it { should validate_presence_of :text }
  it { should validate_uniqueness_of :text }
end
