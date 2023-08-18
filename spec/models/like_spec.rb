require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Methods' do
    before(:each) do
      @user = User.new(name: 'Tomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @user.save
      @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post')
      @like = Like.new(post: @post, author: @user )
      @post.save
      @like.save
    end


    it 'update_likes_counter counts automatically when creating a new Like (as a callback function)' do
      expect(@like.post.likes_counter).to eq(1)
      second_like = Like.create(post: @post, author: @user )
      expect(@like.post.likes_counter).to eq(2)
    end
  end


end
