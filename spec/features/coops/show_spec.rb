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
end
