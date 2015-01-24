json.array!(@tours) do |tour|
  json.extract! tour, :id, :created_at, :name, :description_short
  json.url tour_url(tour, format: :json)
end
