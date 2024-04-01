# frozen_string_literal: true

require 'rails_helper'
require 'support/views/shared_examples/form_behavior'

RSpec.describe 'todos/edit.html.erb', type: :view do
  before(:each) do
    @todo = assign(:todo, create(:todo))

    render
  end

  it 'displays the page title' do
    expect(rendered).to have_css('h2', text: 'Edit todo')
  end

  it_behaves_like 'a todo form in view spec'

  describe 'back button' do
    it 'is displayed' do
      expect(rendered).to have_link('Back', href: /#{todos_path}|#{root_path}/)
    end
  end

  describe 'update button' do
    it 'is displayed' do
      expect(rendered).to have_button('Update Todo', type: 'submit')
    end
  end
end
