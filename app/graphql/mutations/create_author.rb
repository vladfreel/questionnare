class Mutations::CreateQuestion < Mutations::BaseMutation
  null true

  argument :content, String, required: true

  field :question, QuestionType, null: true
  field :errors, [String], null: false

  def resolve(content:)
    question = Question.new(content: content)
    if question.save
      # Successful creation, return the created object with no errors
      {
          question: question,
          errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
          question: nil,
          errors: question.errors.full_messages
      }
    end
  end
end