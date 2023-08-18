require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    
    before(:each) do
      @user = User.new(name: 'Tomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @user.save
    end
    
    it 'name should be present' do
      expect(@user).to be_valid
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'posts_counter should be an integer greater or equal to zero' do
      expect(@user).to be_valid
      @user.posts_counter = -1
      expect(@user).to_not be_valid
      @user.posts_counter = nil
      expect(@user).to_not be_valid
      @user.posts_counter = 34
      expect(@user).to be_valid
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
