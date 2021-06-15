require 'rails_helper'

RSpec.describe NagerService do
  describe "class methods" do
    describe "#upcoming holidays" do
      it 'has attributes' do
        upcoming = NagerService.upcoming_holidays

        expect(upcoming[0][:name].class).to eq(String)
        expect(upcoming[0][:date].class).to eq(String)
        expect(upcoming[0][:countryCode]).to eq('US')
      end
    end
  end
end