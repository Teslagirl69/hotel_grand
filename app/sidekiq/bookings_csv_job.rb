require 'csv'

class BookingsCsvJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ExportBookingsToCsv.call
  end
end