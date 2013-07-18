require 'spec_helper'

describe Category do
  it { should have_many :tags }
  it { should have_many(:questions).through(:tags) }

  it { validate_presence_of :text }
end
