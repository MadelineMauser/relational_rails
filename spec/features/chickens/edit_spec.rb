require 'rails_helper'

RSpec.feature "chicken edit page", type: :feature do
  it 'has a link through the chicken show page' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    chicken1 = coop1.chickens.create!(name: 'Martha', is_broody: false, clutch_count: 3)

    visit "/chickens/#{chicken1.id}"
    click_link 'Update Chicken'

    expect(page).to have_current_path("/chickens/#{chicken1.id}/edit")
  end
  it 'can update the chicken record' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    chicken1 = coop1.chickens.create!(name: 'Martha', is_broody: false, clutch_count: 3)
    
    visit "/chickens/#{chicken1.id}/edit"
    fill_in "Name", with: 'Cherry'
    choose 'is_broody_true'
    click_button 'Update Chicken'
    
    expect(page).to have_current_path("/chickens/#{chicken1.id}")
    expect(page).to have_content("Cherry")
    expect(page).to have_content("Is broody: true")
    expect(page).to have_content("Clutch count: 3")
  end
end
