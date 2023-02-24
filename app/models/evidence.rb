# frozen_string_literal: true

class Evidence < ApplicationRecord
  has_many :users
  has_many :questions
end
