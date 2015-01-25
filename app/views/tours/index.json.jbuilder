json.array!(@tours) do |tour|
<<<<<<< HEAD
  json.extract! tour, :id, :created_at, :name, :short_description
=======
  json.extract! tour, :id, :created_at, :name, :description_short
>>>>>>> adding-tours
  json.url tour_url(tour, format: :json)
end
