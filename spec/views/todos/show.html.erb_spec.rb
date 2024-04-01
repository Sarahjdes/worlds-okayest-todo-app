# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'todos/show.html.erb', type: :view do
  before(:each) do
    @todo = assign(:todo, create(:todo))

    render
  end

  it 'displays the todo title' do
    expect(rendered).to have_css('h2', text: @todo.title)
  end

  it 'displays the todo content' do
    expect(rendered).to have_css('p', text: @todo.content)
  end

  describe 'the back button' do
    it 'is displayed' do
      expect(rendered).to have_link('Back', href: /#{todos_path}|#{root_path}/)
    end
  end

  describe 'the edit button' do
    it 'is displayed' do
      expect(rendered).to have_link('Edit', href: edit_todo_path(@todo))
    end
  end

  describe 'the delete button' do
    it 'is displayed' do
      expect(rendered).to have_css("a[data-turbo-method='delete']")
    end
  end
end
