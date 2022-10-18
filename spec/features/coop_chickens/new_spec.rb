require 'rails_helper'

RSpec.feature "coop chicken new page", type: :feature do
  it 'has a link through the coop chickens index' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)

    visit "/coops/#{coop1.id}/chickens"
    click_link 'Create Chicken'

    expect(page).to have_current_path("/coops/#{coop1.id}/chickens/new")
  end
  it 'can create a new chicken for the coop' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)

    visit "/coops/#{coop1.id}/chickens/new"

    fill_in 'Name', with: 'Twitchy'
    choose 'is_broody_true'
    fill_in 'Clutch count:', with: 4
    click_button 'Create Chicken'

    expect(page).to have_current_path("/coops/#{coop1.id}/chickens")
    expect(page).to have_content('Twitchy')
    expect(page).to have_content('Is broody: true')
    expect(page).to have_content('Clutch count: 4')
  end
end