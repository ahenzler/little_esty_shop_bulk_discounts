require 'rails_helper'

RSpec.describe 'index' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')

    @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')
    @customer_2 = Customer.create!(first_name: 'Cecilia', last_name: 'Jones')
    @customer_3 = Customer.create!(first_name: 'Mariah', last_name: 'Carrey')
    @customer_4 = Customer.create!(first_name: 'Leigh Ann', last_name: 'Bron')
    @customer_5 = Customer.create!(first_name: 'Sylvester', last_name: 'Nader')
    @customer_6 = Customer.create!(first_name: 'Herber', last_name: 'Coon')

    @invoice_1 = Invoice.create!(customer_id: @customer_1.id, status: 2)
    @invoice_2 = Invoice.create!(customer_id: @customer_1.id, status: 2)
    @invoice_3 = Invoice.create!(customer_id: @customer_2.id, status: 2)
    @invoice_4 = Invoice.create!(customer_id: @customer_3.id, status: 2)
    @invoice_5 = Invoice.create!(customer_id: @customer_4.id, status: 2)
    @invoice_6 = Invoice.create!(customer_id: @customer_5.id, status: 2)
    @invoice_7 = Invoice.create!(customer_id: @customer_6.id, status: 1)

    @item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: @merchant1.id)
    @item_2 = Item.create!(name: "Conditioner", description: "This makes your hair shiny", unit_price: 8, merchant_id: @merchant1.id)
    @item_3 = Item.create!(name: "Brush", description: "This takes out tangles", unit_price: 5, merchant_id: @merchant1.id)
    @item_4 = Item.create!(name: "Hair tie", description: "This holds up your hair", unit_price: 1, merchant_id: @merchant1.id)

    @ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 1, unit_price: 10, status: 0)
    @ii_2 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_2.id, quantity: 1, unit_price: 8, status: 0)
    @ii_3 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_3.id, quantity: 1, unit_price: 5, status: 2)
    @ii_4 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_4.id, quantity: 1, unit_price: 5, status: 1)

    @transaction1 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_1.id)
    @transaction2 = Transaction.create!(credit_card_number: 230948, result: 1, invoice_id: @invoice_3.id)
    @transaction3 = Transaction.create!(credit_card_number: 234092, result: 1, invoice_id: @invoice_4.id)
    @transaction4 = Transaction.create!(credit_card_number: 230429, result: 1, invoice_id: @invoice_5.id)
    @transaction5 = Transaction.create!(credit_card_number: 102938, result: 1, invoice_id: @invoice_6.id)
    @transaction6 = Transaction.create!(credit_card_number: 879799, result: 1, invoice_id: @invoice_7.id)
    @transaction7 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_2.id)

    @discount1 = @merchant1.bulk_discounts.create!(percentage_discount: 70, quantity_threshold: 3)
    @discount2 = @merchant1.bulk_discounts.create!(percentage_discount: 50, quantity_threshold: 1)
    @discount3 = @merchant1.bulk_discounts.create!(percentage_discount: 20, quantity_threshold: 5)

    allow(NagerService).to receive(:upcoming_holidays).and_return([
              {name: 'Labor Day', date: '2021-07-05'},
              {name: 'Columbus Day', date: '2021-09-06'},
              {name: 'Veterans Day', date: '2021-10-11'}])

    visit "/merchant/#{@merchant1.id}/bulk_discounts"
  end

  describe 'bulk discount list and links' do
    it 'lists all bulk discounts and attributes' do

      expect(page).to have_content(@discount1.percentage_discount)
      expect(page).to have_content(@discount1.quantity_threshold)

      expect(page).to have_content(@discount2.percentage_discount)
      expect(page).to have_content(@discount2.quantity_threshold)

      expect(page).to have_content(@discount3.percentage_discount)
      expect(page).to have_content(@discount3.quantity_threshold)
    end

    it 'has a link to each bulk discount show page' do

      expect(page).to have_link("View Discount")
    end
  end
  describe 'public holidays' do
    it 'has next three holidays' do

      expect(page).to have_content('Upcoming Holidays')

      expect(page).to have_content('Labor Day')
      expect(page).to have_content('Columbus Day')
      expect(page).to have_content('Veterans Day')

      expect(page).to have_content('2021-07-05')
      expect(page).to have_content('2021-09-06')
      expect(page).to have_content('2021-10-11')
    end
  end

  describe 'create new discount' do
    it 'can create new discount' do

      expect(page).to have_link('Create New Discount')
      click_on('Create New Discount')
      expect(current_path).to eq("/merchant/#{@merchant1.id}/bulk_discounts/new")
    end
  end

  describe 'remove discount' do
    it 'can remove discount' do
      expect(page).to have_button("Delete Discount")
      within "div#dis-#{@discount1.id}" do
        click_on("Delete Discount")
      end
      expect(page).to_not have_content(@discount1)
    end
  end
end
