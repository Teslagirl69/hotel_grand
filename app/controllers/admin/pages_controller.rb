# frozen_string_literal: true


  class Admin::PagesController < ApplicationController
    before_action :authenticate_admin!
    def dashboard
      @bookings = Booking.all.order('bookings.created_at desc')
      @caclulations = CalculateDailyStatService.new.calculate
    end
  end

