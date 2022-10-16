# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :set_room, only: %i[show]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all.order(:created_at).page params[:page]
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @booking = Booking.new
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def room_params
    params.require(:room).permit(:name, :description, :price, :short_description, images: [])
  end
end
