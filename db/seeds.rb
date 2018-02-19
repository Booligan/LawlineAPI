5.times do
    User.create({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.unique.email
    })

    Product.create({
        name: Faker::Coffee.blend_name,
        description: Faker::Coffee.notes,
        price: Faker::Commerce.price,
        image: "NO IMAGE AVAILABLE"
    })
end
