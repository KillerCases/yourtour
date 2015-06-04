json.array!(@calendar_requests) do |calendar_request|
  json.extract! calendar_request, :id, :tour_id, :user_id
  json.url calendar_request_url(calendar_request, format: :json)
end
