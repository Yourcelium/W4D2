# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

  Cat.destroy_all
  
  c1= Cat.create!(name: 'Jean', color: 'brown', sex: "F", birth_date: Date.new(2007, 6, 20), description: "Best damn cat west of the mississippi." )
  c2= Cat.create!(name: 'Nomo', color: 'black', sex: "M", birth_date: Date.new(1996, 3, 27), description: "THIS CAT WILL CUT YOU" )
  c1= Cat.create!(name: 'Carl Jungus', color: 'chrome', sex: "M", birth_date: Date.new(2000, 1, 1), description: "FEAR THE CARL" )
  
  
  CatRentalRequest.destroy_all
  
  cr1 = CatRentalRequest.create!(cat_id: c1.id, start_date: Date.new(2018, 1, 20), end_date: Date.new(2018, 3, 20), status: "APPROVED")
  cr1 = CatRentalRequest.create!(cat_id: c1.id, start_date: Date.new(2018, 1, 10), end_date: Date.new(2018, 1, 18), status: 'APPROVED')
end