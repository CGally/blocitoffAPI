class Item < ApplicationRecord
  belongs_to :user
  default_scope { order('created_at DESC') }

  validates :description, length: { minimum: 3 }, presence: true
end
