# frozen_string_literal: true

class AddedTitleToTodoAndSwappedValues < ActiveRecord::Migration[7.1]
  def up
    change_table :todos do |t|
      t.rename :content, :title
      t.text :content
    end

    change_column :todos, :title, :string
  end

  def down
    change_column :todos, :title, :text

    change_table :todos do |t|
      t.rename :title, :content
      t.remove :title
    end
  end
end
