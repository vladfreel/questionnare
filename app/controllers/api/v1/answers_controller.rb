class Api::V1::AnswersController < ApplicationController
  before_action :get_answer, only: [ :show, :update, :destroy ]
  # GET /answers
  def index
    @answers = Answer.all
    render json: @answers
  end

  # POST /answers
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    if @answer.save!
      render json: @answer, status: :created
    else
      render json: @answer.errors, status: :unprocessable_entity
    end

  end

  # GET /answers/:id
  def show
    render json: @answer
  end

  # PUT /answers/:id
  def update
    @answer.update(answer_params)
    head :no_content
  end

  # DELETE /answers/:id
  def destroy
    @answer.destroy
    head :no_content
  end

  private

  def answer_params
    # whitelist params
    params.permit(:content, :question_id)
  end

  def find_question
    @answer = Answer.find(params[:id])
  end
end
