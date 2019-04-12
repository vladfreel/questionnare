module Types
  class MutationType < Types::BaseObject
    field :create_question, mutation: Mutations::CreateQuestion
  end
end
