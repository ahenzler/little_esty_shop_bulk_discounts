class BulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.bulk_discounts.all
    @holidays = NegerHoliday.next_three
  end
end