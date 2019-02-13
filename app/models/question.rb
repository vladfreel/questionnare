class Question < ApplicationRecord
  validates_presence_of :content
  has_many :answers, dependent: :destroy
end
