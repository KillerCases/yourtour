# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TourCity.delete_all
TourCity.create([{city:'Boston', country:'USA'}, {city: "New York", country:"USA"}, {city: "San Francisco", country:"USA"}, {city: "London", country:"UK"}])

TourGuide.delete_all
TourGuide.create([{name:'Tamar', description:'Political expert'}, {name: "Alice", description:"Artist in Residence"}])

TourPrice.delete_all
TourPrice.create([{name:'USA - Basic', duration: '1 hour', price_adult:'20', price_child:'5', currency:'USD'}, {name:'UK - Basic', duration: '1 hour', price_adult:'20', price_child:'5', currency:'GBP'}])

Tour.delete_all
Tour.create([{name:"Turnpike Murals", short_description: "Turnpike Lane is a busy cosmopolitan neighbourhood in North East London. Its also home to the Turnpike Art Group (TAG) founded in 2012 as a community-focused street redesign programme. Since then, TAG has commissioned numerous works from artists ", tour_guide_id: "1", tour_city_id: "4", tour_price_id:"2", long_description:"Turnpike Lane", meeting_point_description: "Turnpike Lane Underground Station", min_customer_threshold:"1", address:"Turnpike Lane Underground Station, London, UK"}])

