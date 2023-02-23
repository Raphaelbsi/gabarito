# frozen_string_literal: true

FactoryBot.define do
  factory :evidence do
    name { FFaker::NameBR.first_name }
  end
end
