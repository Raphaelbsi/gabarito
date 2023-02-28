# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :user
  has_many :alternatives, dependent: :destroy
  has_many :evidences, dependent: :destroy

  validates :user_id, uniqueness: { scope: :user_id, message: 'Já respondeu está prova' }
end
