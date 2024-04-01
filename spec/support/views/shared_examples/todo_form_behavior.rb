# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'a todo form in view spec' do
  describe 'has a title field' do
    it 'with a label' do
      expect(rendered).to have_css('label', text: 'Title')
    end

    it 'with a field' do
      expect(rendered).to have_field('todo[title]')
      expect(rendered).to have_css('input')
      expect(rendered).to include('type="text"')
    end
  end

  describe 'has a content field' do
    it 'with a label' do
      expect(rendered).to have_css('label', text: 'Content')
    end

    it 'with a field' do
      expect(rendered).to have_field('todo[content]')
      expect(rendered).to have_css('textarea')
    end
  end
end
