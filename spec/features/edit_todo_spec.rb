# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Editing a Todo', type: :feature do
  let!(:todo) { create(:todo) }

  scenario 'with valid input' do
    visit todos_path
    find('li > a', match: :first).click
    click_link('Edit')
    fill_in('todo_title', with: 'Mow the lawn')
    click_button('Update Todo')
    expect(page).to have_content('Mow the lawn')
  end

  scenario 'with invalid input' do
    visit todos_path
    find('li > a', match: :first).click
    click_link('Edit')
    fill_in('todo_content', with: '')
    click_button('Update Todo')
    content_field = page.find('div.turbo-form--content')
    expect(content_field.all('div.field_with_errors').size).to eq(2)
    expect(content_field.find('.full-message').text).to eq("Content can't be blank")
  end
end
