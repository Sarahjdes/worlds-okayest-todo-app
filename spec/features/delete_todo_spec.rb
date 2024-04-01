# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Delete a Todo', type: :feature do
  scenario 'and confirm deletion' do
    create(:todo, title: 'This todo will be deleted')

    visit todos_path
    click_link('This todo will be deleted')
    click_link('Delete')

    sleep 1

    page.driver.browser.switch_to.alert.accept

    expect(page).to_not have_content('This todo will be deleted')
  end

  scenario 'and dismiss deletion' do
    create(:todo, title: 'This todo will not really be deleted')

    visit todos_path
    click_link('This todo will not really be deleted')
    click_link('Delete')

    sleep 1

    page.driver.browser.switch_to.alert.dismiss

    expect(page).to have_content('This todo will not really be deleted')
  end
end
