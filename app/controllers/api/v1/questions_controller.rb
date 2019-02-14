class Api::V1::QuestionsController < ApplicationController
  before_action :find_question, only: %i[show update destroy]

  # GET /questions
  def index
    @questions = Question.all
    render json: @questions.to_json(include: :answers), status: :ok
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    if @question.save!
      render json: @question, status: :created
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # GET /questions/:id
  def show
    render json: @question.to_json(include: :answers), status: :ok
  end

  # PUT /questions/:id
  def update
    @question.update!(question_params)
    render json: @question.to_json(include: :answers), status: :no_content
  end

  # DELETE /questions/:id
  def destroy
    @question.destroy
    head :no_content
  end

  private

  def question_params
    # whitelist params
    params.require(:question).permit(:content)
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
