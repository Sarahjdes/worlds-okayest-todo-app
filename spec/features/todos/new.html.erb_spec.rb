# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'todos/new page', type: :feature do
  before do
    visit new_todo_path
  end

  it 'displays the page title' do
    expect(page).to have_css('h2', text: 'New todo')
  end

  it 'displays the create form' do
    expect(page).to have_field('Title')
    expect(page).to have_field('Content')
  end

  it_behaves_like 'a todo form'

  describe 'back button' do
    it 'is displayed' do
      expect(page).to have_link('Back', href: /#{todos_path}|#{root_path}/)
    end

    it 'brings the user to the home page on click' do
      click_link(text: 'Back', href: /#{todos_path}|#{root_path}/)

      expect(page).to have_current_path(/#{todos_path}|#{root_path}/)
      expect(page).to have_css('h2', text: 'Things to do')
    end
  end

  describe 'create button' do
    it 'is displayed' do
      expect(page).to have_button('Create Todo', type: 'submit')
    end

    it 'brings the user back to the home page on submit when both fields are correctly filled' do
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
