30.times do
  User.create!(
    email: Faker::Internet.email,
    password: "secrete",
    name: Faker::Name.name,
    address: Faker::Address.full_address
  )
end

5.times do
  Campany.create!(
    name: Faker::Company.name,
  )
end


Category.create([
  { name: "House" }, 
  { name: "Car" }, 
  { name: "Motor" }, 
  { name: "Gold" }
])

20.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    img: Faker::Avatar.image,
    description: Faker::Lorem.paragraph,
    campany_id: Campany.all.sample.id,
    category_id: Category.all.sample.id,
  )
end

70.times do
  Order.create!(
    product_id: Product.all.sample.id,
    user_id: User.all.sample.id,
  )
end
