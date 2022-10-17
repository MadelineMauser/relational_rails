require 'rails_helper'

RSpec.feature "coop show page", type: :feature do
  it 'shows the attributes of the specified parent' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    coop2 = Coop.create!(name: 'Cluck Hut', is_portable: false, nest_box_num: 6)

    visit "/coops/#{coop1.id}"

    expect(page).to have_content(coop1.name)
    expect(page).to have_content("Is portable: #{coop1.is_portable}")
    expect(page).to have_content("Nest Box Number: #{coop1.nest_box_num}")
    expect(page).to have_content("Created at: #{coop1.created_at}")
    expect(page).to have_content("Updated at: #{coop1.updated_at}")

    expect(page).not_to have_content(coop2.name)
    expect(page).not_to have_content("Is portable: #{coop2.is_portable}")
    expect(page).not_to have_content("Nest Box Number: #{coop2.nest_box_num}")
  end
  it 'shows the count of children associated with the given parent' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    chicken1 = coop1.chickens.create!(name: 'Martha', is_broody: false, clutch_count: 3)
    chicken2 = coop1.chickens.create!(name: 'Peeper', is_broody: true, clutch_count: 4)
    chicken3 = coop1.chickens.create!(name: 'Gretta', is_broody: false, clutch_count: 6)
    chicken4 = coop1.chickens.create!(name: 'Pumpkin', is_broody: true, clutch_count: 5)

    visit "/coops/#{coop1.id}"

    expect(page).to have_content("Current number of chickens: #{coop1.chickens.count}")
  end
end
