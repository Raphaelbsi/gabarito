# frozen_string_literal: true

class Evidence < ApplicationRecord
  has_many :users, dependent: :nullify
end
