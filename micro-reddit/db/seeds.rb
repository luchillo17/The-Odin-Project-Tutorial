# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'luchillo17', email: 'luchillo17@gmail.com', password: 'belorofonte', password_confirmation: 'belorofonte')
User.first.posts.create(title: 'First Post', body: 'This is the firs post.')
User.first.posts.first.comments.create(user_id: User.first.id, comment: 'This is the firs comment.')