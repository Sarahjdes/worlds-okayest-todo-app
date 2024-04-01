# frozen_string_literal: true

require 'rails_helper'

# for views, the top "describe" should be the name of the file
# rspec-rails knows not to use Capybara for view tests
RSpec.describe 'todos/index.html.erb', type: :view do
  before(:each) do
    # We're assigning to :todos (the @todos of the index action in the controller)
    # The value of a list that contains one todo
    @todos = assign(:todos, create_list(:todo, 1))

    render
  end

  it 'displays index page title' do
    expect(rendered).to have_css('h2', text: 'Things to do')
  end

  it 'displays a list of todos containing exactly one todo after creating one' do
    expect(rendered).to have_css('li', count: 1)
  end

  it 'displays a list of todos containing exactly two todo after creating another one' do
    assign(:todos, create_list(:todo, 1))

    render

    expect(rendered).to have_css('li', count: 2)
  end

  describe 'each todo item' do
    it 'displays its title' do
      @todos.each do |todo|
        expect(rendered).to have_css('li', text: todo.title)
      end
    end

    it 'has a link to that todo show page' do
      @todos.each do |todo|
        expect(rendered).to have_css("a[href='#{todo_path(todo.id)}']")
      end
    end

    # Not necessary, we know that the current view has a correct href value
    # It is the controller's job to show the correct view after navigation
    # This is an example of something that does not need to be there
    # it 'directs the user to the correct show page after link was clicked' do
    #   click_link(text: todo.title, href: todo_path(todo.id))

    #   expect(page).to have_current_path(todo_path(todo.id))
    #   expect(page).to have_css('h2', text: todo.title)
    # end
  end

  describe "'Add todo' button" do
    it "has a 'Add todo' button" do
      expect(rendered).to have_css("a[href='#{new_todo_path}']", text: 'Add todo')
    end
  end
end
