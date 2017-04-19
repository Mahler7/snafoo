class Suggestion < ApplicationRecord
  validates :name, :purchase_location, presence: true
  validates :name, uniqueness: true
end
