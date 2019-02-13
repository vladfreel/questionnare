class Api::V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]

  # GET /questions
  def index
    @questions = Question.all
    render json: @questions
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
    render json: @question
  end

  # PUT /questions/:id
  def update
    @question.update(question_params)
    head :no_content
  end

  # DELETE /questions/:id
  def destroy
    @question.destroy
    head :no_content
  end

  private

  def question_params
    # whitelist params
    params.permit(:title)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
