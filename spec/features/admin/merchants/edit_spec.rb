require 'rails_helper'

RSpec.describe 'admin merchant index page' do
  before :each do
    @merchant1 = Merchant.create(name: "Robespierre the Second")
  end

  it 'can redirect to edit page from admin merchant show' do
    visit admin_merchant_path(@merchant1.id)
    expect(page).to have_content("#{@merchant1.name}")

    click_on 'Edit'

    expect(current_path).to eq("/admin/merchants/#{@merchant1.id}/edit")
  end

  it 'can fill fields, click submit and change merchant info' do
    visit "/admin/merchants/#{@merchant1.id}/edit"

      fill_in 'Name', with: 'Washington'
      click_on 'Submit'

    expect(current_path).to eq("/admin/merchants/#{@merchant1.id}")
    expect(page).to have_content("Washington")
  end

end
