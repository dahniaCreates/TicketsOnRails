class Category < ApplicationRecord
  has_many :tickets, dependent: :destroy
  has_many :street_categories
  has_many :streets, through: :street_categories

  validates :name, presence: true, uniqueness: true
  paginates_per 20
end
