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
      @post.title = 'a' * 251
      expect(@post).to_not be_valid
      @post.title = 'a' * 250
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
      @post.save
    end

    it 'update_posts_counter counts automatically when creating a new Like (as a callback function)' do
      expect(@user.posts_counter).to eq(1)
      Post.create(author: @user, title: 'Hello', text: 'This is my first post')
      expect(@user.posts_counter).to eq(2)
    end

    describe 'recent_comments Method' do
      it 'returns the five most recent comments' do
        Comment.create(post: @post, author: @user, text: 'Hi Tom! 1', created_at: 7.day.ago)
        Comment.create(post: @post, author: @user, text: 'Hi Tom! 2', created_at: 6.day.ago)
        Comment.create(post: @post, author: @user, text: 'Hi Tom! 3', created_at: 5.day.ago)
        comment4 = Comment.create(post: @post, author: @user, text: 'Hi Tom! 4', created_at: 4.day.ago)
        comment5 = Comment.create(post: @post, author: @user, text: 'Hi Tom! 5', created_at: 3.day.ago)
        comment6 = Comment.create(post: @post, author: @user, text: 'Hi Tom! 6', created_at: 2.day.ago)
        comment7 = Comment.create(post: @post, author: @user, text: 'Hi Tom! 7', created_at: 1.day.ago)
        comment8 = Comment.create(post: @post, author: @user, text: 'Hi Tom! 8')

        expect(@post.recent_comments).to eq([comment8, comment7, comment6, comment5, comment4])
      end
    end
  end
end
