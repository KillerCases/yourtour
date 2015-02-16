json.array!(@tour_cities) do |tour_city|
  json.extract! tour_city, :id, :city, :country
  json.url tour_city_url(tour_city, format: :json)
end
