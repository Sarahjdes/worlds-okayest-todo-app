# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'todos/index page', type: :feature do
  let!(:todo) { create(:todo) }

  before do
    visit todos_path
  end

  it 'displays index page title' do
    expect(page).to have_css('h2', text: 'Things to do')
  end

  it 'displays a list of todos containing exactly one todo after creating one' do
    ul = page.find('ul')

    li_count = ul.all('li').size

    expect(li_count).to equal(1)
  end

  it 'displays a list of todos containing exactly two todo after creating another one' do
    Todo.create(title: 'Another todo', content: 'And some more content')

    refresh

    ul = page.find('ul')

    li_count = ul.all('li').size

    expect(li_count).to equal(2)
  end

  describe 'each todo item' do
    it 'displays its title' do
      expect(page).to have_link(text: todo.title)
    end

    it 'has a link to that todo show page' do
      expect(page).to have_link(text: todo.title, href: todo_path(todo.id))
    end

    it 'directs the user to the correct show page after link was clicked' do
      click_link(text: todo.title, href: todo_path(todo.id))

      expect(page).to have_current_path(todo_path(todo.id))
      expect(page).to have_css('h2', text: todo.title)
    end
  end

  describe "'Add todo' button" do
    it "has a 'Add todo' button" do
      expect(page).to have_link(text: 'Add todo', href: new_todo_path)
    end

    it "directs the user to todo creation page after 'Add todo' button was clicked" do
      click_link(text: 'Add todo', href: new_todo_path)

      expect(page).to have_current_path(new_todo_path)
      expect(page).to have_css('h2', text: 'New todo')
    end
  end
end
