# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { FFaker::NameBR.first_name }
    password { FFaker::Internet.password }
    first_name { FFaker::NameBR.first_name }
    last_name { FFaker::NameBR.last_name }
    email { FFaker::Internet.email }
  end
end
