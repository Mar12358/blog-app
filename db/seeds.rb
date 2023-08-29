# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', email: "martingon.dev@gmail.com", password: "19768", photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', email: "gonzalez.martin.35@gmail.com", password: '19768', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80', bio: 'Teacher from Poland.')
third_user = User.create(name: 'Martin', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80', bio: 'Full Stack Web Developer!')

first_post = Post.create(author: first_user, title: 'Hello Post 1', text: 'This is my first post, I am Tom')
second_post = Post.create(author: first_user, title: 'Hello Post 2', text: 'This is my second post. I am Tom!')
third_post = Post.create(author: second_user, title: 'Hello Post 3', text: 'This is my first post and I\'m Lilly')
fourth_post = Post.create(author: second_user, title: 'Hello Post 4', text: 'This is my second post and I\im Lilly')
fifth_post = Post.create(author: third_user, title: 'Hello Post 5', text: 'This is my first post and I am Martin')

Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Tom, 2nd Comment!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Tom! 3d Comment' )
Comment.create(post: second_post, author: first_user, text: 'Hi Lilly!' )
Comment.create(post: third_post, author: second_user, text: 'I am Lilly!' )
Comment.create(post: first_post, author: first_user, text: 'Hi, I am Tom and this is my comment to my post!' )
Comment.create(post: fourth_post, author: first_user, text: 'Hi, Lilly! I am Tom and this is my comment to your post!' )

Like.create(author: third_user, post: second_post)
Like.create(author: second_user, post: second_post)
Like.create(author: first_user, post: fifth_post)
Like.create(author: third_user, post: fifth_post)
Like.create(author: third_user, post: first_post)
