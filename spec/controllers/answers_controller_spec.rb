require 'rails_helper'

RSpec.describe Api::V1::AnswersController, type: :controller do

  describe 'CREATE' do
    it 'create category(CREATE)' do
      question = create(:question)
      expect do
        post :create, params: { answer: { content: 'some text',
                                          question_id: question } }
      end.to change { Answer.count }.by(1) and
          redirect_to Answer.last && have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end

  describe 'PUT update' do
    it "allows an article to be updated" do
      question = create(:question)
      answer = create(:answer)
      put :update, params: {id: answer.id,
                            answer: answer.attributes = { content: 'new content' },
                            question_id: question }
      expect(response).to have_http_status(204)
      expect(answer.content).to eql 'new content'
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the category' do
      answer = create(:answer)
      expect do
        delete :destroy, params: { id: answer }
      end.to change(Answer, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end
