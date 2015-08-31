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
Tour.create([{name:"Turnpike Murals", short_description: "Turnpike Lane artist community gives a tour of the murals in the local area", tour_guide_id: "1", tour_city_id: "4", tour_price_id:"2", long_description:"urnpike Lane is a busy cosmopolitan neighbourhood in North East London. Its also home to the Turnpike Art Group (TAG) founded in 2012 as a community-focused street redesign programme. Since then, TAG has commissioned numerous works from artists ", meeting_point_description: "Turnpike Lane Underground Station", min_customer_threshold:"1", address:"Turnpike Lane Underground Station, London, UK"}, {name:"Black History of Beacon Hill", short_description: "Learn about the little known immigrant and African American heritage of this classic New England neighbourhood", tour_guide_id: "1", tour_city_id: "1", tour_price_id:"1", long_description:"Today Beacon Hill is known as one of the most affluent neighborhoods in Boston. However, few people know that from the mid-1700s onwards, the north slope of Beacon Hill was the home of African Americans, sailors and Eastern European immigrants. The area around Belknap Street (now Joy Street) in particular became home to more than 1,000 African Americans who established the African Meeting House and five black churches. In this tour, learn about the history of black abolitionists who formed the New England Anti-Slavery Society and established Beacon Hill as an important depot on the Underground Railroad. Visit historic buildings where Frederick Douglas spoke and hear how the history of this area became intwined with subsequent immigrant communities.", meeting_point_description: "Outside the Charles Street Pub", min_customer_threshold:"1", address:"149 Charles St Boston, MA 02114"}])

