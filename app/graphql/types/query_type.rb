module Types
  class QueryType < Types::BaseObject
    description "root query"

    field :questions, [QuestionType], null: true do
      description "gets all questions"
    end

    field :question, QuestionType, null: true do
      description "Find a question by id"
      argument :id, ID, required: true
    end

    field :answers, [AnswerType], null: true do
      description "Get all Answers"
    end

    field :answer, AnswerType, null: true do
      description "Find a answer by id"
      argument :id, ID, required: true
    end


    def questions
      Question.all
    end

    def question(id:)
      Question.find(id)
    end

    def answers
      Answer.all
    end

    def answer(id:)
      Answer.find(id)
    end
  end
end
