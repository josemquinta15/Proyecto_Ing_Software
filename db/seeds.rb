# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'johndoe@email.com', password: '12345678', password_confirmation: '12345678', last_name: 'Doe',
            first_name: 'John', phone: '00700000', city: 'Springfield', gender: 'M')
User.create(email: 'thor.odinson@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: 'Odinson', first_name: 'Thor', phone: '77777777', city: 'Asgard', gender: 'M')
User.create(email: 'tony.stark@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: 'Stark', first_name: 'Anthony', phone: '56123123', city: 'New York', gender: 'M')
User.create(email: 'bruce.banner@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: 'Banner', first_name: 'Robert', phone: '56123123', city: 'San Diego', gender: 'M')
User.create(email: 'steve.rogers@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: 'Rogers', first_name: 'Steve', phone: '56123123', city: 'Brooklyn', gender: 'M')
User.create(email: 'wanda.maximoff@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: 'Maximoff', first_name: 'Wanda', phone: '56123123', city: 'Westfield', gender: 'F')
User.create(email: 'tchalla@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: 'Charles', first_name: 'Luke', phone: '56123123', city: 'Wakanda', gender: 'M')
User.create(email: 'natasha.romanoff@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: 'Romanoff', first_name: 'Natasha', phone: '56123123', city: 'Moscu', gender: 'F')
User.create(email: 'monica.rambeau@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: 'Rambeau', first_name: 'Monica', phone: '56123123', city: 'Kree', gender: 'F')
User.create(email: 'james.rhodes@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: 'Rhodes', first_name: 'James', phone: '56123123', city: 'New York', gender: 'M')
User.create(email: 'peter.parker@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: 'Parker', first_name: 'Peter', phone: '56123123', city: 'Queens', gender: 'M')
User.create(email: 'scott.lang@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: 'Lang', first_name: 'Scott', phone: '56123123', city: 'San Francisco', gender: 'M')
User.create(email: 'vision@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: '-', first_name: 'Vision', phone: '56123123', city: 'New York', gender: 'M')
User.create(email: 'stephen.strange@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: 'Strange', first_name: 'Stephen', phone: '56123123', city: 'Kamar-Taj', gender: 'M')
User.create(email: 'nick.fury@avengers.us', password: '12345678', password_confirmation: '12345678',
            last_name: 'Fury', first_name: 'Nicholas', phone: '56123123', city: 'New York', gender: 'M')

Post.create(title: 'Cow', text: 'Milky milky', price: '600000', level: '1', animal: 'Cow',
            ptype: 'Sell', location: 'Linares', user_id: '1', date: DateTime.now)
Post.create(title: 'Horse', text: 'Who knows Spirit?', price: '3000000', level: '1', animal: 'Horse',
            ptype: 'Sell', location: 'Talca', user_id: '2', date: DateTime.now)
Post.create(title: 'Cat', text: 'Mew mew', price: '88000', level: '1', animal: 'Cat',
            ptype: 'Sell', location: 'Sell', user_id: '3', date: DateTime.now)
Post.create(title: 'Hamster', text: 'A little pal', price: '44000', level: '1', animal: 'Hamster',
            ptype: 'Sell', location: 'Puerto Varas', user_id: '4', date: DateTime.now)
Post.create(title: 'Chicken', text: 'You will not be able to sleep when it grows', price: '30000',
            level: '1', animal: 'Other', ptype: 'Sell', location: 'Curico', user_id: '5', date: DateTime.now)
Post.create(title: 'Parrot', text: 'Stop repeating my words', price: '450000', level: '1', animal: 'Other',
            ptype: 'Sell', location: 'Wakanda', user_id: '6', date: DateTime.now)
Post.create(title: 'Goldfish', text: 'Nice color', price: '61000', level: '1', animal: 'Other',
            ptype: 'Sell', location: 'Santiago', user_id: '7', date: DateTime.now)
Post.create(title: 'Python', text: 'I know you very well', price: '100000', level: '1', animal: 'Other',
            ptype: 'Sell', location: 'Rancagua', user_id: '8', date: DateTime.now)
Post.create(title: 'Cobra', text: 'Careful it knows karate', price: '600000', level: '1', animal: 'Other',
            ptype: 'Sell', location: 'Osorno', user_id: '9', date: DateTime.now)
Post.create(title: 'Turtle', text: 'S...o... s...l...o...w...', price: '110000', level: '1', animal: 'Other',
            ptype: 'Sell', location: 'Iquique', user_id: '10', date: DateTime.now)
Post.create(title: 'Cat-fish', text: 'I am you', price: '22500', level: '1', animal: 'Other',
            ptype: 'Sell', location: 'Arica', user_id: '11', date: DateTime.now)
Post.create(title: 'Husky', text: 'A loyal friend', price: '240000', level: '1', animal: 'Dog',
            ptype: 'Sell', location: 'La Serena', user_id: '12', date: DateTime.now)
Post.create(title: 'Cod', text: 'Loves cold water', price: '27000', level: '1', animal: 'Other',
            ptype: 'Sell', location: 'Pucon', user_id: '13', date: DateTime.now)
Post.create(title: 'Rabbit', text: 'Jumps higher than me', price: '56000', level: '1', animal: 'Other',
            ptype: 'Sell', location: 'Santiago', user_id: '14', date: DateTime.now)
Post.create(title: 'Penguin', text: 'His name is Waddles', price: '120000', level: '1', animal: 'Other',
            ptype: 'Sell', location: 'Lo Barnechea', user_id: '15', date: DateTime.now)

if Rails.env.development?
  AdminUser.create!(email: 'admin@perrits.com', password: 'password', password_confirmation: 'password')

  User.create(email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678', last_name: 'Quintana',
              first_name: 'José Miguel', phone: '997764456', city: 'Santiago', gender: 'M')

  User.create(email: 'test2@gmail.com', password: '12345678', password_confirmation: '12345678', last_name: 'Zaror',
              first_name: 'Vicente', phone: '996642258', city: 'Santiago', gender: 'M')

  Post.create(title: 'Golden Retriever', text: 'Beautiful golden retriever searching for a new family', price: 230_000,
              level: '1', animal: 'Dog', ptype: 'Sell',
              location: 'Santiago', user_id: 1, date: DateTime.now)
  Post.create(title: 'Beautiful Cat', text: 'Cat without house search for someone who loves him', price: 0, level: '1',
              animal: 'Cat', ptype: 'Adoption',
              location: 'La Reina', user_id: 1, date: DateTime.now)
  Post.create(title: 'Wonderful Bird', text: 'This is my bird, I sell it because i don´t have money to live',
              price: 50_000, level: '1', animal: 'Bird', ptype: 'Sell', location: 'Las Condes', user_id: 2,
              date: DateTime.now)

  User.create(email: 'joserubiod@gmail.com', password: '12345678', password_confirmation: '12345678',
              last_name: 'Rubio', first_name: 'Josemaria', phone: '982389922', city: 'Santiago', gender: 'M')
  User.create(email: 'carlosperez@gmail.com', password: '12345678', password_confirmation: '12345678',
              last_name: 'carlos', first_name: 'perez', phone: '996642258', city: 'Santiago', gender: 'M')
end
