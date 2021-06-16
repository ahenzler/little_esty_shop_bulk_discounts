class BulkDiscountsController < ApplicationController

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @discount = @merchant.bulk_discounts.find(params[:id])
  end

  def index
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.bulk_discounts.all
    @holidays = NegerHoliday.next_three
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    discount = merchant.bulk_discounts.new(discount_params)
    if discount.save
      redirect_to "/merchant/#{merchant.id}/bulk_discounts"
    else
      flash[:notice] = "Error: Please Fill In Field"
      redirect_to "/merchant/#{merchant.id}/bulk_discounts/new"
    end
  end

  def destroy
    merchant = Merchant.find(params[:merchant_id])
    discount = merchant.bulk_discounts.find(params[:id])
    merchant.bulk_discounts.delete(discount)
    redirect_to "/merchant/#{merchant.id}/bulk_discounts"
  end

    private

  def discount_params
    params.permit(:percentage_discount, :quantity_threshold)
  end
end