require "rails_helper"

RSpec.describe Api::V1::QuestionsController, type: :controller do

  describe 'CREATE' do
    it 'create category(CREATE)' do
      expect do
        post :create, params: { question: {content: 'some text'} }
      end.to change { Question.count }.by(1) and
          redirect_to Question.last && have_http_status(200)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe 'INDEX' do
    it 'assigns @categories' do
      question = create(:question)
      get :index
      expect(response.content_type).to eq('application/json')
      expect(assigns(:questions)).to eq([question])
      expect(response).to have_http_status(200)
    end
  end

  describe 'PUT update' do
    it "allows an article to be updated" do
      question = create(:question)
      put :update, params: {id: question.id,
                            question: question.attributes = { content: 'new content' }}
      expect(response).to have_http_status(204)
      expect(question.content).to eql 'new content'
    end
  end

  describe 'SHOW' do
    it 'assigns the requested category to @category' do
      question = create(:question)
      answer = create(:answer, question: question)
      get :show, params: { id: question.id }
      expect(assigns(:question)).to eq(question)
      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the category' do
      question = create(:question)
      expect do
        delete :destroy, params: { id: question }
      end.to change(Question, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end