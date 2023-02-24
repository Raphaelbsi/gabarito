# frozen_string_literal: true

class Evidence < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions

  validates :name, presence: true
end
