require 'rails_helper'

RSpec.feature "chicken index page", type: :feature do
  it "shows each chicken and its attributes" do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    chicken1 = coop1.chickens.create!(name: 'Martha', is_broody: false, clutch_count: 3)
    coop2 = Coop.create!(name: 'Cluck Hut', is_portable: false, nest_box_num: 6)
    chicken2 = coop2.chickens.create!(name: 'Peeper', is_broody: true, clutch_count: 4)

    visit '/chickens'

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
  end
  it 'has a link to it that appears on every page' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    chicken1 = coop1.chickens.create!(name: 'Martha', is_broody: false, clutch_count: 3)

    visit '/coops'
    click_link("Chicken Index")
    expect(page).to have_current_path('/chickens')

    visit "/coops/#{coop1.id}"
    click_link("Chicken Index")
    expect(page).to have_current_path('/chickens')

    visit "/coops/#{coop1.id}/chickens"
    click_link("Chicken Index")
    expect(page).to have_current_path('/chickens')

    visit "/chickens"
    click_link("Chicken Index")
    expect(page).to have_current_path('/chickens')

    visit "/chickens/#{chicken1.id}"
    click_link("Chicken Index")
    expect(page).to have_current_path('/chickens')
  end
end
