require 'rails_helper'

RSpec.feature "coop new page", type: :feature do
  it 'is linked to through the coop index page' do
    visit '/coops'
    click_link 'New Coop'
    expect(page).to have_current_path('/coops/new')
  end
  it 'can create a new coop' do
    visit '/coops/new'
    fill_in 'Name', with: 'New Coop'
    choose '#is_portable_true'
    fill_in 'Nest box number', with: '4'
    click_button('Create Coop')
    
    expect(page).to have_current_path('/coops')
    expect(page).to have_content('New Coop')
  end
end