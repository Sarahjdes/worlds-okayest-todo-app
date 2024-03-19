require 'rails_helper'

RSpec.describe Todo, type: :model do
  # This creates test data using the factory
  let(:todo) { build(:todo) }

  it 'has a valid factory' do
    expect(todo).to be_valid
  end

  describe '#content' do
    subject { todo.content }

    # This tests the validity of the data created through the factory
    it { is_expected.to eq 'This is a thing to do' }
  end

  # This tests other use cases
  it 'has valid content' do
    expect(Todo.new(content: nil)).to_not be_valid
    expect(Todo.new(content: '')).to_not be_valid
    expect(Todo.new(content: 'This neends to be done')).to be_valid
  end
end
