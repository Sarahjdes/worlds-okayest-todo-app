# frozen_string_literal: true

class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      # Creates a content column of type text
      t.text :content

      # Adds a created_at and an updated_at columns
      t.timestamps

      # An id column is also created, starting at index 1
    end
  end
end
