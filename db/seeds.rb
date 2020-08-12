# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create name: "Leafy green", priority: 1, image: 'https://h2m4j5c4.rocketcdn.me/wp-content/uploads/2019/01/LeafyGreensTray-1170x781.jpg'
Category.create name: "Cruciferous", priority: 2, image: 'https://fruitsandveggies.org/wp-content/uploads/2019/02/atb_032217_image.jpg'
Category.create name: "Marrow", priority: 3, image: 'https://www.cooksinfo.com/wp-content/uploads/Marrow-Striped.jpg'
Category.create name: "Root", priority: 4, image: 'https://www.saga.co.uk/contentlibrary/saga/publishing/verticals/health-and-wellbeing/diet-and-nutrition/rootveg2shutterstock_365866316768x576.jpg'

user = User.create name: 'Potato', username: 'potato'

article = Article.create({
  title: "Did you know that eating cabbages increases your IQ",
  text: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
  image_url: 'https://www.thespruceeats.com/thmb/DVNRYj_l3s2ZogwY9ZVB4IooPHg=/1879x1409/smart/filters:no_upscale()/Headsofgreencabbage-5bfda38346e0fb00264606e3.jpg',
  category_ids: [1],
  author_id: user.id
})
