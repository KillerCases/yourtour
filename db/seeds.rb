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
TourGuide.create([{name:'Tamar', description:'Political expert'}, {name: "Alice", description:"Artist in Residence"}, , {name: "Pete", description:"Born and bred Boston local"}])

TourPrice.delete_all
TourPrice.create([{name:'USA - Basic', duration: '1 hour', price_adult:'20', price_child:'5', currency:'USD'}, {name:'UK - Basic', duration: '1 hour', price_adult:'20', price_child:'5', currency:'GBP'}])

Tour.delete_all
Tour.create([{name:"Turnpike Murals", short_description: "Turnpike Lane artist community gives a tour of the murals in the local area", tour_guide_id: "1", tour_city_id: "4", tour_price_id:"2", long_description:"Turnpike Lane is a busy cosmopolitan neighbourhood in North East London. Its also home to the Turnpike Art Group (TAG) founded in 2012 as a community-focused street redesign programme. Since then, TAG has commissioned numerous works from artists ", meeting_point_description: "Turnpike Lane Underground Station", min_customer_threshold:"1", address:"Turnpike Lane Underground Station, London, UK"}, {name:"Black History of Beacon Hill", short_description: "Learn about the little known immigrant and African American heritage of this classic New England neighbourhood", tour_guide_id: "3", tour_city_id: "1", tour_price_id:"1", long_description:"Today Beacon Hill is known as one of the most affluent neighborhoods in Boston. However, few people know that from the mid-1700s onwards, the north slope of Beacon Hill was the home of African Americans, sailors and Eastern European immigrants. The area around Belknap Street (now Joy Street) in particular became home to more than 1,000 African Americans who established the African Meeting House and five black churches. In this tour, learn about the history of black abolitionists who formed the New England Anti-Slavery Society and established Beacon Hill as an important depot on the Underground Railroad. Visit historic buildings where Frederick Douglas spoke and hear how the history of this area became intwined with subsequent immigrant communities.", meeting_point_description: "Outside the Charles Street Pub", min_customer_threshold:"1", address:"149 Charles St Boston, MA 02114"}, {name:"Boston Commons", short_description: "Discover the history of Boston Common since 1634 onwards", tour_guide_id: "1", tour_city_id: "1", tour_price_id:"1", long_description:"States dating from 1634. Over the years the common has been used as a cattle grazing ground, an encampment for British soldiers and a place for public hangings! In 1830 the park gained true status and begun it's ascent to the elegant grounds it is today. In this tour, learn about the history of the park and the people who have shaped it.", meeting_point_description: "Boloco Boston Common", min_customer_threshold:"1", address:"2 Park Plaza Boston, MA"}, {name:"Mt Feake Cemetary", short_description: "History and inhabitants of historic Waltham cemetery", tour_guide_id: "1", tour_city_id: "1", tour_price_id:"1", long_description:"Mount Feake Cemetery is a beautiful and historic cemetery in Waltham, Massachusetts. Established in 1857, it is one of the best-preserved garden cemeteries in the state and listed on the National Register of Historic Places. In this tour, learn about the garden cemetery movement that shaped it and the people who have been buried here over the years, including Effie Canning who wrote the 'Rock-a-bye Baby' lullaby.", meeting_point_description: "Entrance to the Cemetary", min_customer_threshold:"1", address:"203 Prospect Street, Waltham, MA"}, {name:"Waltham Watch City", short_description: "Tour of Waltham and Watch Factory highlights", tour_guide_id: "1", tour_city_id: "1", tour_price_id:"1", long_description:"Waltham is often known as 'Watch City' because of it's association with the watch making industry. Over the course of 80 years, over 35 million watches, clocks and instruments were manufactured here. Even today, remains of that industrial past can be found all over the town. In this tour we'll explore the Waltham Watch Company factory and uncover stories from the people who worked there.", meeting_point_description: "Meet outside the India Show Room", min_customer_threshold:"1", address:"India Show Room 270 Moody St Waltham, MA 02453"}, {name:"Guatemalan Waltham", short_description: "Stories from Guatemalan families and immigrants who made this neighborhood home", tour_guide_id: "1", tour_city_id: "1", tour_price_id:"1", long_description:"Waltham is a diverse neighborhood with a large community of residents from Guatemala and El Salvador. Casa Guatemala is an organization dedicated to preserving and celebrating the beauty of Guatemala culture among families and youth in the area. Hear about the stories of first generation immigrants who came to join family and make a life in the United States.", meeting_point_description: "Outside the restaurant entrance", min_customer_threshold:"1", address:"Guanachapi's restaurant, moody street"}])

