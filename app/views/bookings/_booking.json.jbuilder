json.extract! booking, :id, :start_date, :last_date, :room_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
