class ExportBookingsToCsv
  def self.call
    new.call
  end

  def call
    CSV.open('./files/bookings.csv', 'a+') do |csv|
      @last_booking = Booking.all.accepted.order(updated_at: :desc).first
      csv << [@last_booking.id, @last_booking.start_date, @last_booking.last_date, @last_booking.created_at, @last_booking.user_name, @last_booking.user_email, @last_booking.room_id]
    end
  end
end