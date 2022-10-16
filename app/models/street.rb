class Street < ApplicationRecord
  has_many :tickets
  has_many :street_categories
  has_many :categories, through: :street_categories

  validates :name, presence: true, uniqueness: true
  paginates_per 20
end
