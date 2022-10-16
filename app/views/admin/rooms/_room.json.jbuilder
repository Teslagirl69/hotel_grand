json.extract! room, :id, :name, :description, :price, :short_description, :created_at, :updated_at
json.url room_url(room, format: :json)
