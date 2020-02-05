# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer_1 = Customer.create({
    name: "Customer A",
    bank_type: "atm",
    response: "xml",
    language: "English",
    locations: 200
})

customer_2 = Customer.create({
    name: "Customer B",
    bank_type: "bank",
    response: "json",
    language: "Spanish",
    locations: 20
})

customer_3 = Customer.create({
    name: "Customer C",
    bank_type: "atm",
    response: "json",
    language: "French",
    locations: 5
})