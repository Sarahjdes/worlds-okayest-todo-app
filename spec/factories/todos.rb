# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    title { 'Some title' }
    content { 'This is a thing to do' }
  end
end
