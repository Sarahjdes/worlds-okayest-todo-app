# frozen_string_literal: true

require 'rails_helper'
require 'support/views/shared_examples/form_behavior'

RSpec.describe 'todos/new.html.erb', type: :view do
  before(:each) do
    @todo = assign(:todo, Todo.new)

    render
  end

  it 'displays the page title' do
    expect(rendered).to have_css('h2', text: 'New todo')
  end

  # Will find an example named 'a todo form' in the spec/support/features/share_examples folder
  it_behaves_like 'a todo form in view spec'

  describe 'back button' do
    it 'is displayed' do
      expect(rendered).to have_link('Back', href: /#{todos_path}|#{root_path}/)
    end
  end

  describe 'create button' do
    it 'is displayed' do
      expect(rendered).to have_button('Create Todo', type: 'submit')
    end
  end
end
