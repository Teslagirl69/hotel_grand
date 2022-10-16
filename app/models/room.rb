class Room < ApplicationRecord
  has_many :bookings
  has_many_attached :images
  paginates_per 2

  def self.available_rooms(start_date, last_date)
    Booking.excluded_id(start_date, last_date)
  end

  def images_as_thumbnails(image)
    return unless image.content_type.in?(%w[image/jpg image/jpeg image/png])
       image.variant(resize_to_limit: [400,400]).processed
  end
end
