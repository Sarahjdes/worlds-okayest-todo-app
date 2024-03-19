class Todo < ApplicationRecord
    # Validates that "content" is present
    validates :content, presence: true
end
