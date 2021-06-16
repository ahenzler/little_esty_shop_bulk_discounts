require 'rails_helper'

RSpec.describe 'bulk discount creation' do
  before(:each) do
    @merchant1 = Merchant.create!(name: 'Hair Care')
    visit "/merchant/#{@merchant1.id}/bulk_discounts/new"
  end

  describe 'new discount' do
    it 'renders the new form' do

      expect(page).to have_content('Create New Bulk Discount')
      expect(find('form')).to have_content('Percentage discount')
      expect(find('form')).to have_content('Quantity threshold')
    end
  end

  describe 'create' do
    context 'given valid data' do
      it 'creates the discount' do

        fill_in 'Percentage discount', with: 25
        fill_in 'Quantity threshold', with: 3
        click_on 'Save'

        expect(page).to have_current_path("/merchant/#{@merchant1.id}/bulk_discounts")
        expect(page).to have_content(25)
        expect(page).to have_content(3)
      end
    end

    context 'given invalid data' do
      it 're-renders the new form' do

        fill_in 'Percentage discount', with: '25'
        click_on 'Save'

        expect(page).to have_current_path("/merchant/#{@merchant1.id}/bulk_discounts/new")
        expect(page).to have_content("Error: Please Fill In Field")
      end
    end
  end
end
