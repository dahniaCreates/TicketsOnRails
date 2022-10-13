class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :ticket_number
      t.string :date
      t.float :discounted_fine
      t.integer :full_fine

      t.timestamps
    end
  end
end
