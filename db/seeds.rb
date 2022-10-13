# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

Category.destroy_all
Ticket.destroy_all
Officer.destroy_all
Street.destroy_all
StreetCategory.destroy_all

200.times do
  Officer.create(name: Faker::Name.unique.name)
end

csv_file = Rails.root.join("db/violations_data.csv")
csv_data = File.read(csv_file)

violations_data = CSV.parse(csv_data, headers: true, encoding: "iso-8859-1")

violations_data.each do |violation|
  category = Category.find_or_create_by(name: violation["Violation"])
  street = Street.find_or_create_by(name: violation["Street"])
  officer = Officer.all.sample
  if category.valid? && category && street.valid? && street
    violation = Ticket.create(
      ticket_number:   Faker::Code.unique.npi,
      date:            violation["Issue Date"],
      discounted_fine: violation["Discounted Fine"],
      full_fine:       violation["Full Fine"],
      category:        category,
      street:          street,
      officer:         officer
    )

  # street to categories
  if street.valid? && street
    StreetCategory.create(street: street, category: category)
  end
    puts "Invalid ticket #{violation['name']}" unless violation&.valid?
  else
    puts "Invalid category #{violation['Violation']} for tickets."
  end
end

puts "Created #{Category.count} categories."
puts "Created #{Ticket.count} tickets."
puts "Created #{Officer.count} officers."
puts "Created #{Street.count} streets."
puts "Created #{StreetCategory.count} street categories."
