# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  enum :role, %i[admin participant]
end
