# Admin User seeded to DB

User.create(first_name:"admin", last_name:"admin", email: "admin@lawline.com", password:"123456789")

# 4 more users seeded to DB
4.times do
    User.create({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(9)
    })
end

# 10 products seeded to DB
10.times do
    Product.create({
        name: Faker::Coffee.blend_name,
        description: Faker::Coffee.notes,
        price: Faker::Commerce.price,
        image: "NO IMAGE AVAILABLE"
    })
end
