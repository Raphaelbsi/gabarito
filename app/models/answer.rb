# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :user
  has_many :alternatives, dependent: :destroy
  has_many :evidences, dependent: :destroy

  after_save :score_calculator
  # validates :user_id, uniqueness: { scope: :user_id, message: 'Já respondeu está prova' }

  def score_calculator
    ScoreCalculator.call(alternative_id, user_id, evidences_id)
  end
end
