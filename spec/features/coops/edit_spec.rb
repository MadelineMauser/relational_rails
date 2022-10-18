require 'rails_helper'

RSpec.feature "coop edit page", type: :feature do
  it 'is linked to through the coop show page' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)

    visit "/coops/#{coop1.id}"
    click_link 'Update Coop'
    expect(page).to have_current_path("/coops/#{coop1.id}/edit")
  end
  it 'can update an existing coop' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    new_box_num = 3

    visit "/coops/#{coop1.id}/edit"
    fill_in 'Coop name:', with: 'Changed Coop'
    fill_in 'nest_box_num', with: new_box_num
    click_button('Update Coop')
    binding.pry
    expect(page).to have_current_path("/coops/#{coop1.id}")
    expect(page).not_to have_content('Cozy Cottage')
    expect(page).to have_content('Changed Coop')
    expect(page).to have_content("Is portable: true")
    expect(page).to have_content("Nest box number: #{new_box_num}")
  end
end