require 'rails_helper'

RSpec.describe 'Questions API', type: :request do

  it 'creates a Question' do
    post '/api/v1/questions', params: { question: {content: 'Some text'} }
    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(:created)
  end

  it 'updates a Question' do
    question = create(:question)
    put "/api/v1/questions/#{question.id}", params: { question: {content: 'New content'} }
    expect(response).to have_http_status(:no_content)
  end

  it 'gets a list of questions with answers' do
    create(:question)
    create(:question)
    questionn = create(:question)
    create(:answer, question: questionn )
    get '/api/v1/questions'

    json = JSON.parse(response.body)
    expect(response).to have_http_status(:ok)
    expect(json.count).to eq(3)
    expect(json[2]['answers'].count).to eq(1)
  end

  it 'gets question with answers' do
    question = create(:question)
    create(:answer, question: question )
    get "/api/v1/questions/#{question.id}"

    json = JSON.parse(response.body)
    expect(response).to have_http_status(:ok)
    expect(json['answers'].count).to eq(1)
  end

  it 'destroy question' do
    question = create(:question)
    create(:answer, question: question )
    delete "/api/v1/questions/#{question.id}"

    expect(response).to have_http_status(:no_content)
    expect(Question.all.count).to eq(0)
    expect(Answer.all.count).to eq(0)
  end

end