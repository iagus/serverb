require 'test_helper'
require 'net/http'

describe 'server gets GET' do
  it 'must return 200' do
    request = Net::HTTP.new('localhost', 3000)
    response = request.request_head('/')
    assert response.code.to_i == 200
  end
end
