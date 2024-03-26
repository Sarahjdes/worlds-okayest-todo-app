require 'rails_helper'

RSpec.describe "Creating a Todo", type: :feature do
    scenario "with valid input" do
        visit todos_path
        click_link("Add todo")
        fill_in("todo_title", with: "Wash the dishes")
        fill_in("todo_content", with: "Only wash the pots and pans")
        click_button("Create Todo")

        expect(page).to have_content("Wash the dishes")
    end

    scenario "with invalid input" do
        visit todos_path
        click_link("Add todo")
        fill_in("todo_title", with: "Wash the dishes")
        # omitting content
        click_button("Create Todo")

        expect(page).to_not have_content("Wash the dishes")
    end
end