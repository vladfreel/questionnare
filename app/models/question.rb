class Question < ApplicationRecord
  validates_presence_of :content
  has_many :answers, dependent: :delete_all
end
