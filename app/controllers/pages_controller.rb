# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @rooms = Room.all.first(3)
    data = CurrentWeatherService.new(latitude: '59.93', longitude: '30.33', units: 'metric').call
    @weather = Weather.new(data)
  end
end
