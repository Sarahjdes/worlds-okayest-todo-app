# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  # This creates test data using the factory
  let(:todo) { build(:todo) }

  it 'has a valid factory' do
    expect(todo).to be_valid
  end

  describe '#title' do
    subject { todo.title }

    # This tests the validity of the data created through the factory
    it { is_expected.to eq 'Some title' }
  end

  describe '#content' do
    subject { todo.content }

    # This tests the validity of the data created through the factory
    it { is_expected.to eq 'This is a thing to do' }
  end

  # This tests other use cases
  it 'has valid title' do
    expect(Todo.new(title: nil, content: 'And this is some explanation')).to_not be_valid
    expect(Todo.new(title: '', content: 'And this is some explanation')).to_not be_valid
    expect(Todo.new(title: 'This needs to be done', content: 'And this is some explanation')).to be_valid
  end

  it 'has valid content' do
    expect(Todo.new(title: 'This needs to be done', content: nil)).to_not be_valid
    expect(Todo.new(title: 'This needs to be done', content: '')).to_not be_valid
    expect(Todo.new(title: 'This needs to be done', content: 'And this is some explanation')).to be_valid
  end
end
