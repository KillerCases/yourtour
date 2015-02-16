json.array!(@tour_guides) do |tour_guide|
  json.extract! tour_guide, :id, :name, :description
  json.url tour_guide_url(tour_guide, format: :json)
end
