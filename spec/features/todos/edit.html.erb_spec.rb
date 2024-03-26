# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'todos/edit page', type: :feature do
  let!(:todo) { create(:todo) }

  before do
    visit edit_todo_path(todo)
  end

  it 'displays the page title' do
    expect(page).to have_css('h2', text: 'Edit todo')
  end

  it "displays a title field pre-filled with the todo's title" do
    expect(page).to have_field('Title')

    title_field = page.find_field('todo_title').value
    expect(title_field).to eq(todo.title)
  end

  it "displays a content field pre-filled with the todo's content" do
    expect(page).to have_field('Content')

    content_field = page.find_field('todo_content').value
    expect(content_field).to eq(todo.content)
  end

  it_behaves_like 'a todo form'

  describe 'back button' do
    it 'is displayed' do
      expect(page).to have_link('Back', href: /#{todos_path}|#{root_path}/)
    end

    it 'visits the home page on back button click' do
      click_link(text: 'Back', href: /#{todos_path}|#{root_path}/)

      expect(page).to have_current_path(/#{todos_path}|#{root_path}/)
      expect(page).to have_css('h2', text: 'Things to do')
    end
  end

  describe 'update button' do
    it 'is displayed' do
      expect(page).to have_button('Update Todo', type: 'submit')
    end

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
