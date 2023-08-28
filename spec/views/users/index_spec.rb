require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'Index page' do
    let!(:user1) do
      User.create(name: 'Martin',
                  photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
                  bio: 'Bio for Martin')
    end

    let!(:user2) do
      User.create(name: 'Matias',
                  photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
                  bio: 'Bio for Matias')
    end

    let!(:user3) do
      User.create(name: 'Flor',
                  photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
                  bio: 'Bio for Flor')
    end

    let!(:posts) do
      Post.create(author_id: user1.id, title: 'Post title from Martin Post 1', text: 'Martin Post Text')
      Post.create(author_id: user2.id, title: 'Post title from Matias Post 1', text: 'Matias Post 1 Text')
      Post.create(author_id: user2.id, title: 'Post title from Matias Post 2', text: 'Matias Post 2 Text')
    end

    before do
      visit users_path
    end

    it 'shows the right page' do
      expect(page).to have_content('Users Index')
    end

    it 'displays the username of all users' do
      expect(page).to have_content('Martin')
      expect(page).to have_content('Matias')
      expect(page).to have_content('Flor')
    end

    it 'displays the number of posts for each User' do
      martin_element = find('.user-box', text: 'Martin')
      flor_element = find('.user-box', text: 'Flor')
      matias_element = find('.user-box', text: 'Matias')
      expect(martin_element).to have_selector('p', text: 'Number of posts: 1')
      expect(flor_element).to have_selector('p', text: 'Number of posts: 0')
      expect(matias_element).to have_selector('p', text: 'Number of posts: 2')
    end

    describe 'redirects to each user when clicked' do
      it 'redirects to user1 profile when clicking on user1 link' do
        click_link user1.name
        expect(page).to have_current_path(user_path(user1))
      end
      it 'to user2 profile when clicking on user2 link' do
        click_link user2.name
        expect(page).to have_current_path(user_path(user2))
      end
      it 'to user3 profile when clicking on user3 link' do
        click_link user3.name
        expect(page).to have_current_path(user_path(user3))
      end
    end
  end
end
