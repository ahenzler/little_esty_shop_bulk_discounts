class NagerService
  def self.upcoming_holidays
    response = Faraday.get "https://date.nager.at/api/v3/NextPublicHolidays/us"

    body = response.body
    JSON.parse(body, symbolize_names: true)
  end
end