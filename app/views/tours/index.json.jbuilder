json.array!(@tours) do |tour|
  json.extract! tour, :id, :created_at, :name, :short_description
  json.url tour_url(tour, format: :json)
end
