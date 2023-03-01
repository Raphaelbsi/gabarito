class Ranking < ApplicationRecord
  belongs_to :evidence
  belongs_to :user
end
