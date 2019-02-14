require 'rails_helper'

RSpec.describe 'Answers API' do
  it 'creates a Question' do
    question = create(:question)
    post '/api/v1/answers', params: { answer: {content: 'Some text',
                                               question_id: question.id } }
    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(:created)
  end

  it 'updates a Question' do
    question = create(:question)
    answer = create(:answer, question: question)
    put "/api/v1/answers/#{answer.id}", params: { answer: {content: 'New content'} }
    expect(response).to have_http_status(:no_content)
  end

  it 'destroy question' do
    question = create(:question)
    answer = create(:answer, question: question )
    delete "/api/v1/answers/#{answer.id}"

    expect(response).to have_http_status(:no_content)
    expect(Question.all.count).to eq(1)
    expect(Answer.all.count).to eq(0)
  end
end