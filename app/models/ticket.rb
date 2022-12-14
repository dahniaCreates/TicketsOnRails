class Ticket < ApplicationRecord
  belongs_to :category
  belongs_to :street
  belongs_to :officer
  validates :ticket_number, :date, :discounted_fine, :full_fine, presence: true
  validates :ticket_number, numericality: true, uniqueness: true

  paginates_per 20
end
