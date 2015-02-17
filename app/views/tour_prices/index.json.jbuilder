json.array!(@tour_prices) do |tour_price|
  json.extract! tour_price, :id, :name, :duration, :price_adult, :price_child, :currency
  json.url tour_price_url(tour_price, format: :json)
end
