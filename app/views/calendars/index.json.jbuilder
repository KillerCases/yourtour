json.array!(@calendars) do |calendar|
  json.extract! calendar, :id, :calendar_datetime
  json.url calendar_url(calendar, format: :json)
end
