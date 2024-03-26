# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'todos/show page', type: :feature do
  let!(:todo) { create(:todo) }

  before do
    visit todo_path(todo)
  end

  it 'displays the todo title' do
    expect(page).to have_css('h2', text: todo.title)
  end

  it 'displays the todo content' do
    expect(page).to have_css('p', text: todo.content)
  end

  describe 'the back button' do
    it 'is displayed' do
      expect(page).to have_link('Back', href: /#{todos_path}|#{root_path}/)
    end

    it 'brings the user to the home page on click' do
      click_link(text: 'Back', href: /#{todos_path}|#{root_path}/)

      expect(page).to have_current_path(/#{todos_path}|#{root_path}/)
      expect(page).to have_css('h2', text: 'Things to do')
    end
  end

  describe 'the edit button' do
    it 'is displayed' do
      expect(page).to have_link('Edit', href: edit_todo_path(todo))
    end

    it 'brings the user to the edit page on click' do
      click_link(text: 'Edit', href: edit_todo_path(todo))

      expect(page).to have_current_path(edit_todo_path(todo))
      expect(page).to have_css('h2', text: 'Edit todo')
    end
  end

  describe 'the delete button' do
    it 'is displayed' do
      link = page.find('a', text: 'Delete')

      expect(link).to be_present
      expect(link['data-turbo-method']).to eq('delete')
    end

    it 'prompts the user a confirmation message on click' do
      click_link(text: 'Delete', href: todo_path(todo))

      sleep 1

      confirm_text = page.driver.browser.switch_to.alert.text

      expect(confirm_text).to eq('Are you sure you want to delete that todo?')

      sleep 1

      page.driver.browser.switch_to.alert.dismiss
    end

    it "keeps the user on current page if user selects 'cancel'" do
      click_link(text: 'Delete', href: todo_path(todo))

      sleep 1

      page.driver.browser.switch_to.alert.dismiss

      expect(page).to have_current_path(todo_path(todo))
      expect(page).to have_css('h2', text: todo.title)
    end

    it "brings the user to the home page if user selects 'confirm', where deleted todo no longer appears" do
      click_link(text: 'Delete', href: todo_path(todo))

      sleep 1

      page.driver.browser.switch_to.alert.accept

      expect(page).to have_current_path(/#{todos_path}|#{root_path}/)
      expect(page).to_not have_css('li', text: todo.title)
    end
  end
end
