require 'rails_helper'

RSpec.feature "coop chicken index page", type: :feature do
  it 'shows each child associated with the given parent and their attributes' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    chicken1 = coop1.chickens.create!(name: 'Martha', is_broody: false, clutch_count: 3)
    chicken2 = coop1.chickens.create!(name: 'Peeper', is_broody: true, clutch_count: 4)
    chicken3 = coop1.chickens.create!(name: 'Gretta', is_broody: false, clutch_count: 6)

    visit "/coops/#{coop1.id}/chickens"

    expect(page).to have_content(chicken1.name)
    expect(page).to have_content("Is broody: #{chicken1.is_broody}")
    expect(page).to have_content("Clutch count: #{chicken1.clutch_count}")
    expect(page).to have_content("Created at: #{chicken1.created_at}")
    expect(page).to have_content("Updated at: #{chicken1.updated_at}")
    expect(page).to have_content(chicken2.name)
    expect(page).to have_content("Is broody: #{chicken2.is_broody}")
    expect(page).to have_content("Clutch count: #{chicken2.clutch_count}")
    expect(page).to have_content("Created at: #{chicken2.created_at}")
    expect(page).to have_content("Updated at: #{chicken2.updated_at}")
    expect(page).to have_content(chicken3.name)
    expect(page).to have_content("Is broody: #{chicken3.is_broody}")
  end
  
end
