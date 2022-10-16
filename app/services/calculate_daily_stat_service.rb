class CalculateDailyStatService

  def initialize
  end

  def calculate
    statistics = Booking.where(created_at: 1.day.ago.all_day).group(:status).count
  end
end