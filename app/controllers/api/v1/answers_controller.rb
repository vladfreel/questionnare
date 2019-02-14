class Api::V1::AnswersController < ApplicationController
  before_action :find_answer, only: %i[show update destroy]

  # POST /answers
  def create
    question = Question.find(params[:answer][:question_id])
    @answer = question.answers.create(answer_params)
    if @answer.save!
      render json: @answer.question.to_json(include: :answers), status: :created
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PUT /answers/:id
  def show
    render json: @answer.to_json, status: :ok
  end

  # PUT /answers/:id
  def update
    @answer.update(answer_params)
    render json: @answer.question, status: :ok
  end

  # DELETE /answers/:id
  def destroy
    @answer.destroy
    head :no_content
  end

  private

  def answer_params
    # whitelist params
    params.require(:answer).permit(:content, :question_id)
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end
end
