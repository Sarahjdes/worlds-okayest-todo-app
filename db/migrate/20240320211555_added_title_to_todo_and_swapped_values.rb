# frozen_string_literal: true

class AddedTitleToTodoAndSwappedValues < ActiveRecord::Migration[7.1]
  def change
    change_table :todos do |t|
      t.rename :content, :title
      t.text :content
    end

    change_column :todos, :title, :string
  end
end
