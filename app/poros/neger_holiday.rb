class NegerHoliday
  def self.next_three
    next_holidays = NagerService.upcoming_holidays
    next_three_holidays = next_holidays[0..2]
  end
end