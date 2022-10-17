require 'rails_helper'

RSpec.feature "coop new page", type: :feature do
  it 'is linked to through the coop index page' do
    visit '/coops'
    click_link 'New Coop'
    expect(page).to have_current_path('/coops/new')
  end
  it 'can create a new coop' do
    visit '/coops/new'
    fill_in 'Coop name:', with: 'Test Coop'
    choose 'is_portable_true'
    fill_in 'Number of nest boxes:', with: '6'
    click_button('Create Coop')
    
    expect(page).to have_current_path('/coops')
    expect(page).to have_content('Test Coop')
  end
end