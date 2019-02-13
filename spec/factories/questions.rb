# spec/factories/questions.rb
FactoryBot.define do
  factory :question do
    content { Faker::Lorem.sentence }
  end
end