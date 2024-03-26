require 'rails_helper'

RSpec.describe "Delete a Todo", type: :feature do
    let!(:todo) { create(:todo) }

    scenario "and confirm deletion" do
        visit todos_path
        click_link("Some title")
        click_link("Delete")

        sleep 1

        page.driver.browser.switch_to.alert.accept

        expect(page).to_not have_content("Some title")
    end

    scenario "and dismiss deletion" do
        visit todos_path
        click_link("Some title")
        click_link("Delete")

        sleep 1

        page.driver.browser.switch_to.alert.dismiss

        expect(page).to have_content("Some title")
    end
end