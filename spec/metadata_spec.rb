require 'pp'

RSpec.describe Hash do
  it 'is used by rspec for metadata', :fast do |example|
    pp example.metadata
  end
end