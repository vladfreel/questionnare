class AnswerType < GraphQL::Schema::Object
  field :id, ID, null: true
  field :content, String, null: true
  field :question_id, ID, null: true
  field :question, QuestionType, null: false
end