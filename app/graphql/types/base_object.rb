module Types
  class BaseObject < GraphQL::Schema::Object
    field :create_question, mutation: Mutations::CreateQuestion
  end
end
