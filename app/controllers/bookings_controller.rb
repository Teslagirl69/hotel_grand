# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]



  # GET /bookings/1 or /bookings/1.json
  def show
    @room = @booking.room
  end

  # GET /bookings/new
  def new
    @rooms = Room.all
    @booking = Booking.new
    @room = @booking.room
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html do
          redirect_to room_booking_path(@booking.room_id, @booking), notice: 'Booking was successfully created.'
        end
         else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def toggle_status
    @booking = Booking.find(params[:id])
    if @booking.pended?
      @booking.accepted!
    elsif @booking.accepted?
      @booking.pended!
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:user_name, :user_email, :start_date, :last_date, :room_id)
  end
end
