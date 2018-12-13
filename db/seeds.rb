# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



photos_url = [ 

"https://www.petsworld.in/blog/wp-content/uploads/2015/09/Batman-Cats-Funny.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2014/09/adorable-cat-1024x576.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2014/09/lovely-white-cat-image-1024x640.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2014/09/funny-cat.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2014/09/cute-adorable-kitten.jpg",
"http://www.petsworld.in/blog/wp-content/uploads/2014/11/persian-cat.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2015/09/cat.png",
"https://www.petsworld.in/blog/wp-content/uploads/2014/11/Birman.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2014/11/American-Shorthair1-1024x640.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2014/11/Oriental.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2014/11/Sphynx.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2015/09/cat-nap.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2015/09/baby-cat-lifting-weights.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2015/09/cat-nikon.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2015/09/rockstar-cat.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2015/09/cat-on-call.jpg",
"https://www.petsworld.in/blog/wp-content/uploads/2015/09/funny-cats-playing-guitar.jpg",
"http://www.petsworld.in/blog/wp-content/uploads/2015/03/Sphynx11.jpg",
"http://www.petsworld.in/blog/wp-content/uploads/2015/03/Savannah-cat1.jpg",
"http://www.petsworld.in/blog/wp-content/uploads/2014/08/Scottish-Fold1.jpg",

]

photos_url.each do |url|

    Item.create(title: Faker::Cat.unique.name, description: Faker::Book.author, price: rand(5.0..20.0).round(2), image_url: url )

end