# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Record.create(title: "Batman", issue: 151, condition: "G", amount: 500)
Record.create(title: "Superman", issue: 120, condition: "VG", amount: 2500)
Record.create(title: "Daredevil", issue: 2, condition: "Mint", amount: 5500)
Record.create(title: "Fantastic Four", issue: 1, condition: "VG", amount: 8500)
