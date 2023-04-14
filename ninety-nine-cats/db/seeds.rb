# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Cat.destroy_all

ApplicationRecord.connection.reset_pk_sequence!("cats")

100.times do
    Cat.create([{ name: Faker::Creature::Cat.name,
                  color: ["black", "white", "orange", "gray", "blue"].sample,
                  sex: ["M", "F"].sample,
                  birth_date: "1/1/2023",
                  description: Faker::Quote.most_interesting_man_in_the_world} ])
end
