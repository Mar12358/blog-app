require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    
    before(:each) do
      @user = User.new(name: 'Tomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @user.save
      @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post')
      @comment = Comment.new(post: @post, author: @user, text: 'Hi Tom!' )
      @post.save
      @comment.save
    end

    it 'comments_counter method works (as a callback function)' do
      expect(@comment.post.comments_counter).to eq(1)
      second_comment = Comment.create(post: @post, author: @user, text: 'Hi Tom!' )
      expect(@comment.post.comments_counter).to eq(2)

    end
    

  end

  describe 'recent_posts Method' do
    it 'returns the three most recent posts' do
      user = User.new(name: 'Martin')
      user.save
      post1 = Post.create(author: user, title: 'Hello', text: 'This is my first post', created_at: 4.day.ago)
      post2 = Post.create(author: user, title: 'Hello', text: 'This is my second post', created_at: 3.day.ago)
      post3 = Post.create(author: user, title: 'Hello', text: 'This is my third post', created_at: 2.day.ago)
      post4 = Post.create(author: user, title: 'Hello', text: 'This is my fourth post', created_at: 1.day.ago)
      post5 = Post.create(author: user, title: 'Hello', text: 'This is my fifth post')

      expect(user.recent_posts).to eq([post5, post4, post3])
    end
  end


end
