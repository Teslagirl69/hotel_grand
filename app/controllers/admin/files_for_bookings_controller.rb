# frozen_string_literal: true


  class Admin::FilesForBookingsController < ApplicationController
    def download
      respond_to do |format|
        format.csv do
          send_file(
            "#{Rails.root}/files/bookings.csv",
            filename: 'bookings.csv',
            type: 'application/csv'
          )
        end
      end
    end
  end

