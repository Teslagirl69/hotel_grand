# frozen_string_literal: true


  class Admin::PdfForBookingsController < ApplicationController
    def download
      @caclulations = CalculateDailyStatService.new.calculate
      @bookings = Booking.all.order('bookings.created_at desc')

      respond_to do |format|
        format.html
        format.pdf do
          render pdf: "bookings_#{1.day.ago.to_date}", template: 'admin/bookings/bookings', formats: [:html]
          PdfGenerateJob.perform_later
        end
      end
    end
  end

