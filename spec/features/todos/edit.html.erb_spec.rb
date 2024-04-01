# frozen_string_literal: true

require 'rails_helper'
require 'support/features/shared_examples/form_behavior'

RSpec.describe 'todos/edit page', type: :feature do
  let!(:todo) { create(:todo) }

  before do
    visit edit_todo_path(todo)
  end

  it_behaves_like 'a todo form in feature spec'

  it "displays a title field pre-filled with the todo's title" do
    title_field = page.find_field('todo_title').value
    expect(title_field).to eq(todo.title)
  end

  it "displays a content field pre-filled with the todo's content" do
    content_field = page.find_field('todo_content').value
    expect(content_field).to eq(todo.content)
  end

  describe 'update button' do
    # May be redundant, also tested using a scenario in spec/features/edit_todo_spec.rb
    it 'brings the user back to the todo page on submit when both fields are correctly filled' do
      fill_in('todo_title', with: 'A new todo')
      fill_in('todo_content', with: 'Some new content for a new todo')

      click_button('Update Todo')

      sleep 1

      new_todo = Todo.last

      expect(page).to have_current_path(todo_path(new_todo.id))
      expect(page).to have_css('h2', text: 'A new todo')
      expect(page).to have_css('p', text: 'Some new content for a new todo')
    end
  end
end
