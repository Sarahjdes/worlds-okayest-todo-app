# frozen_string_literal: true

class Todo < ApplicationRecord
  # Validates that "title" is present
  validates :title, presence: true

  # Validates that "content" is present
  validates :content, presence: true
end
