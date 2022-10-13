class AddStreetRefToTicket < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :street, null: false, foreign_key: true
  end
end
