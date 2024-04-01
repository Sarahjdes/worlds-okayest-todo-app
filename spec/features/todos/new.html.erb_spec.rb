# frozen_string_literal: true

require 'rails_helper'
require 'support/features/shared_examples/todo_form_behavior'

RSpec.describe 'todos/new page', type: :feature do
  before do
    visit new_todo_path
  end

  # @TODO
  it_behaves_like 'a todo form in feature spec'

  it 'displays the page title' do
    expect(page).to have_css('h2', text: 'New todo')
  end

  it 'displays the create form' do
    expect(page).to have_field('Title')
    expect(page).to have_field('Content')
  end

  # May be redundant, also tested using a scenario in spec/features/create_todo_spec.rb
  describe 'create button' do
    it 'brings the user back to the todo\'s show page on submit when both fields are correctly filled' do
      fill_in('todo_title', with: 'A new todo')
      fill_in('todo_content', with: 'Some new content for a new todo')

      click_button('Create Todo')

      sleep 1

      new_todo = Todo.last

      expect(page).to have_current_path(todo_path(new_todo.id))
      expect(page).to have_css('h2', text: 'A new todo')
    end
  end
end
