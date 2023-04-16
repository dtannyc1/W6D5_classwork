# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Destroying Tables..."
Cat.destroy_all
CatRentalRequest.destroy_all

ApplicationRecord.connection.reset_pk_sequence!("cats")
ApplicationRecord.connection.reset_pk_sequence!("cat_rental_requests")

puts "Creating 100 cats..."
100.times do
    Cat.create(name: Faker::Creature::Cat.name,
                  color: ["black", "white", "orange", "gray", "blue"].sample,
                  sex: ["M", "F"].sample,
                  birth_date: "1/1/2023",
                  description: Faker::Quote.most_interesting_man_in_the_world)
end

# 5.times do
#     start_date = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
# end

# puts "Running CatRentalRequests Tests..."
# test_1 = CatRentalRequest.create(
#     cat_id: 1,
#     start_date: Date.today,
#     end_date: Date.today + 7,
#     status: 'APPROVED'
# )

# test_2 = CatRentalRequest.new(
#     cat_id: 1,
#     start_date: Date.today - 2,
#     end_date: Date.today + 2
# )

# test_3 = CatRentalRequest.new(
#     cat_id: 2,
#     start_date: Date.today + 6,
#     end_date: Date.today + 9
# )

# test_4 = CatRentalRequest.new(
#     cat_id: 1,
#     start_date: Date.today + 8,
#     end_date: Date.today + 9
# )

# test_5 = CatRentalRequest.new(
#     cat_id: 1,
#     start_date: Date.today - 7,
#     end_date: Date.today - 3
# )


# p test_2.overlapping_approved_requests
# puts "^ should have one item"

# p test_3.overlapping_approved_requests
# puts "^ different cat, should be empty"

# p test_4.overlapping_approved_requests
# puts "^ no overlap, should be empty"

# p test_5.overlapping_approved_requests
# puts "^ no overlap, should be empty"
