# frozen_string_literal: true

class Alternative < ApplicationRecord
  belongs_to :question
  has_many :answers, dependent: :destroy
  validates :text, presence: true
  # validate :validation_alternatives_correct

  # def validation_alternatives_correct
  #   if correct? && question.alternatives.where(correct: true).count >= 1
  #     errors.add(:correct, 'já existe uma alternativa correta para esta questão')
  #   end
  # end
end
