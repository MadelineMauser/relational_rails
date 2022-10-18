require 'rails_helper'

RSpec.feature "coop index page", type: :feature do
  it 'shows the names of all coop records' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    coop2 = Coop.create!(name: 'Cluck Hut', is_portable: false, nest_box_num: 6)
    coop3 = Coop.create!(name: 'Roaming Home', is_portable: true, nest_box_num: 4)

    visit '/coops'

    expect(page).to have_content(coop1.name)
    expect(page).to have_content(coop2.name)
    expect(page).to have_content(coop3.name)
  end
  it 'shows coops ordered by most recently created' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5, created_at: Time.now + 10.days)
    coop2 = Coop.create!(name: 'Cluck Hut', is_portable: false, nest_box_num: 6, created_at: Time.now)
    coop3 = Coop.create!(name: 'Roaming Home', is_portable: true, nest_box_num: 4, created_at: Time.now + 3.days)

    visit '/coops'

    expect("#{coop1.name}").to appear_before("#{coop3.name}")
    expect("#{coop3.name}").to appear_before("#{coop2.name}")
  end
  it 'shows the records with their creation date next to them' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5, created_at: Time.now + 10.days)

    visit '/coops'

    expect(page).to have_content("#{coop1.name} #{coop1.created_at}")
  end
  it 'has a link to it that appears on every page' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    chicken1 = coop1.chickens.create!(name: 'Martha', is_broody: false, clutch_count: 3)

    visit '/coops'
    click_link("Coop Index")
    expect(page).to have_current_path('/coops')

    visit "/coops/#{coop1.id}"
    click_link("Coop Index")
    expect(page).to have_current_path('/coops')

    visit "/coops/#{coop1.id}/chickens"
    click_link("Coop Index")
    expect(page).to have_current_path('/coops')

    visit "/chickens"
    click_link("Coop Index")
    expect(page).to have_current_path('/coops')

    visit "/chickens/#{chicken1.id}"
    click_link("Coop Index")
    expect(page).to have_current_path('/coops')
  end
  it 'has a link next to each parent to edit that parent' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    
    visit "/coops"

    within("#coop_#{coop1.id}") do
      click_link 'Edit'
    end
    
    expect(page).to have_current_path("/coops/#{coop1.id}/edit")
    expect(page).to have_content('Update Coop')
  end
end
