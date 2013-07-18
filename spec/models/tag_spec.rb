require 'spec-helper'

describe Tag do
  it { should belong_to :question }
  it { should belong_to :category }
end
