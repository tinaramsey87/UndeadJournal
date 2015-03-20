require 'rails_helper'

describe Post do
  it { validates_presence_of :title }

end
