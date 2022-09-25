require 'rails_helper'

RSpec.describe 'merchant bulk discount show ' do
  before :each do
    @merchant1 = Merchant.create!(name: "Robespierre", status: 'Enabled')
    @merchant2 = Merchant.create!(name: "Paul Revere", status: 'Enabled')
    @merchant3 = Merchant.create!(name: "Tom", status: 'Enabled')


    @discount1 = BulkDiscount.create(merchant_id: @merchant1.id, threshold: 15, discount: 10)
    @discount2 = BulkDiscount.create(merchant_id: @merchant2.id, threshold: 25, discount: 20)
    @discount3 = BulkDiscount.create(merchant_id: @merchant2.id, threshold: 35, discount: 30)
  end

  it 'can get to create page from index using a button' do
    visit "/merchants/#{@merchant1.id}/bulk_discounts"
    click_on 'Create New Discount'

    expect(current_path).to eq(new_merchant_bulk_discount_path(@merchant1.id))
  end

  it 'can create a new discount' do
    visit "/merchants/#{@merchant3.id}/bulk_discounts/new"

    expect(page).to_not have_content("40%")

    fill_in("threshold", with: "200")
    fill_in("discount", with: 40)

    click_on "Submit"

    expect(page).to have_content("40%")
  end

end
