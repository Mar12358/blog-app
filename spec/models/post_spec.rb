require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    
    before(:each) do
      @user = User.new(name: 'Tomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @user.save
      @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post')
      @post.save
    end
    
    it 'title should be present' do
      expect(@post).to be_valid
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'title must be less or equal than 250 characters' do
      expect(@post).to be_valid
      @post.title = 'a'*251
      expect(@post).to_not be_valid
      @post.title = 'a'*250
      expect(@post).to be_valid
    end

    it 'comments_counter should be an integer greater or equal to zero' do
      expect(@post).to be_valid
      @post.comments_counter = -1
      expect(@post).to_not be_valid
      @post.comments_counter = nil
      expect(@post).to_not be_valid
      @post.comments_counter = 34
      expect(@post).to be_valid
    end

    it 'likes_counter should be an integer greater or equal to zero' do
      expect(@post).to be_valid
      @post.likes_counter = -1
      expect(@post).to_not be_valid
      @post.likes_counter = nil
      expect(@post).to_not be_valid
      @post.likes_counter = 34
      expect(@post).to be_valid
    end
  end

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
