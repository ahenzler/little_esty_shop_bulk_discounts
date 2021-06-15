require 'rails_helper'

RSpec.describe NagerService do
  describe "class methods" do
    describe "#upcoming holidays" do
      it 'has next three holidays' do
        allow(NagerService).to receive(:upcoming_holidays).and_return([
              {name: 'Labor Day', date: '2021-07-05'},
              {name: 'Columbus Day', date: '2021-09-06'},
              {name: 'Veterans Day', date: '2021-10-11'}])

        next_tres = NegerHoliday.next_three

        expect(next_tres.length).to eq(3)
        expect(next_tres.class).to eq(Array)
        expect(next_tres[0].keys.include?(:name)).to eq(true)
        expect(next_tres[0].keys.include?(:date)).to eq(true)
      end
    end
  end
end
