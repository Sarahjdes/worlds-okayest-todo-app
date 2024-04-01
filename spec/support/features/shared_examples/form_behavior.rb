# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'a todo form in feature spec' do
  describe 'with an empty title field on submit' do
    it 'keeps user on same page' do
      current_path_variable = current_path

      fill_in('todo_title', with: '')

      click_button(class: 'submit')

      expect(page).to have_current_path(current_path_variable)
    end

    it 'shows error fields' do
      fill_in('todo_title', with: '')

      click_button(class: 'submit')

      title_field = page.find('div.turbo-form--title')

      expect(title_field.all('div.field_with_errors').size).to eq(2)
      expect(title_field.find('.full-message').text).to eq("Title can't be blank")
    end
  end

  describe 'with an empty content field on submit' do
    it 'keeps user on same page' do
      current_path_variable = current_path

      fill_in('todo_content', with: '')

      click_button(class: 'submit')

      expect(page).to have_current_path(current_path_variable)
    end

    it 'shows error fields' do
      fill_in('todo_content', with: '')

      click_button(class: 'submit')

      content_field = page.find('div.turbo-form--content')

      expect(content_field.all('div.field_with_errors').size).to eq(2)
      expect(content_field.find('.full-message').text).to eq("Content can't be blank")
    end
  end
end
