# frozen_string_literal: true
# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :evidence
  has_many :alternatives, dependent: :destroy
  has_many :answers, through: :alternativas

  validates :text, presence: true
end
