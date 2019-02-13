# spec/factories/answers.rb
FactoryBot.define do
  factory :answer do
    content { Faker::Lorem.sentence }
    question
  end
end