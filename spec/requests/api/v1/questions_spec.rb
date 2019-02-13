require 'rails_helper'

RSpec.describe 'Questions API' do
  it 'sends a list of questions' do
    create(:question)
    create(:question)
    create(:question)

    get '/api/v1/questions'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success
    # check to make sure the right amount of messages are returned
    expect(json.count).to eq(3)
  end
end