class QuestionType < GraphQL::Schema::Object
  field :id, ID, null: true
  field :content, String, null: true
  field :answers, [AnswerType], null: true
end