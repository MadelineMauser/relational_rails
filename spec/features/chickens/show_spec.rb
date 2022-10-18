require 'rails_helper'

RSpec.feature "chicken show page", type: :feature do
  it "shows the selected chicken and its attributes" do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    chicken1 = coop1.chickens.create!(name: 'Martha', is_broody: false, clutch_count: 3)
    coop2 = Coop.create!(name: 'Cluck Hut', is_portable: false, nest_box_num: 6)
    chicken2 = coop2.chickens.create!(name: 'Peeper', is_broody: true, clutch_count: 4)

    visit "/chickens/#{chicken1.id}"

    expect(page).to have_content(chicken1.name)
    expect(page).to have_content("Is broody: #{chicken1.is_broody}")
    expect(page).to have_content("Clutch count: #{chicken1.clutch_count}")
    expect(page).to have_content("Created at: #{chicken1.created_at}")
    expect(page).to have_content("Updated at: #{chicken1.updated_at}")

    expect(page).not_to have_content(chicken2.name)
    expect(page).not_to have_content("Is broody: #{chicken2.is_broody}")
  end
  it 'has a link to delete this chicken that destroys it' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    chicken1 = coop1.chickens.create!(name: 'Martha', is_broody: false, clutch_count: 3)

    visit "/chickens/#{chicken1.id}"

    click_link 'Delete Chicken'

    expect(page).to have_current_path("/chickens")
    expect(page).not_to have_content("Martha")
  end
end
