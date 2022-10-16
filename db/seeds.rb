# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Chicken.destroy_all
Coop.destroy_all

coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
coop2 = Coop.create!(name: 'Cluck Hut', is_portable: false, nest_box_num: 6)

chicken1 = coop1.chickens.create!(name: 'Martha', is_broody: false, clutch_count: 3)
chicken2 = coop2.chickens.create!(name: 'Peeper', is_broody: true, clutch_count: 4)

    