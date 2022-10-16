# frozen_string_literal: true


  class Admin::BookingsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_booking, only: %i[show edit update destroy]

    # GET /bookings or /bookings.json
    def index
      @bookings = Booking.all.order('bookings.created_at desc')
      @caclulations = CalculateDailyStatService.new.calculate
    end

    # PATCH/PUT /bookings/1 or /bookings/1.json
    def update
      respond_to do |format|
        if @booking.update_columns(status)
          format.html { redirect_to admin_bookings_url, notice: 'Booking was successfully updated.' }
        end
      end
    end

    # DELETE /bookings/1 or /bookings/1.json
    def destroy
      @booking.destroy
      respond_to do |format|
        format.html { redirect_to admin_bookings_url, notice: 'Booking was successfully destroyed.' }
       end
    end

    def toggle_status
      @booking = Booking.find(params[:id])
      if @booking.pended?
        @booking.update_columns(status: 1)
      elsif @booking.accepted?
        @booking.update_columns(status: 0)
      end
      redirect_to admin_bookings_url, notice: 'Booking status has been updated.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:start_date, :last_date, :room_id)
    end
  end

