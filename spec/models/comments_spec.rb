require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'comments_counter method' do
    
    before(:each) do
      @user = User.new(name: 'Tomas', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @user.save
      @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post')
      @comment = Comment.new(post: @post, author: @user, text: 'Hi Tom!' )
      @post.save
      @comment.save
    end

    it 'counts automatically when creating a new Comment (as a callback function)' do
      expect(@comment.post.comments_counter).to eq(1)
      second_comment = Comment.create(post: @post, author: @user, text: 'Hi Tom!' )
      expect(@comment.post.comments_counter).to eq(2)
    end
    

  end


end
