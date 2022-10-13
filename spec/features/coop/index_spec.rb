require 'rails_helper'

RSpec.feature "coop index page", type: :feature do
  it 'shows the names of all coop records' do
    coop1 = Coop.create!(name: 'Cozy Cottage', is_portable: true, nest_box_num: 5)
    coop2 = Coop.create!(name: 'Cluck Hut', is_portable: false, nest_box_num: 6)
    coop2 = Coop.create!(name: 'Roaming Home', is_portable: true, nest_box_num: 4)

    visit '/coops'

    expect(page).to have_content(coop1.name)
    expect(page).to have_content(coop2.name)
    expect(page).to have_content(coop2.name)
  end
end
