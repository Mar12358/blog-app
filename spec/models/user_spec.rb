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


end
