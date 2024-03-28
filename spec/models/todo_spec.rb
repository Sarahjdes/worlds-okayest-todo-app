# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  # This creates test data using the factory
  let(:todo) { build(:todo) }

  # Tests if the instance created by the factory is valid
  it 'has a valid factory' do
    expect(todo).to be_valid
  end

  # This tests the validity of the data created through the factory
  it { is_expected.to have_attribute(:title) }
  it { is_expected.to have_attribute(:content) }

  describe 'validation' do
    it 'does not allow empty title' do
      # From the data we have in the factory, we're only changing the value we want to test
      # Allows to not repeat the valid data AND reduce the chance of making mistakes
      expect(build(:todo, title: nil)).to_not be_valid
      expect(build(:todo, title: '')).to_not be_valid
    end

    it 'does not allow empty content' do
      expect(build(:todo, content: nil)).to_not be_valid
      expect(build(:todo, content: '')).to_not be_valid
    end
  end
end
