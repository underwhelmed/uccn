require 'spec_helper'

describe Post do
  it {should ensure_length_of(:excerpt).is_at_most(2000)}
end
