require 'rails_helper'

RSpec.describe 'Controllers', type: :request do
  describe PostsController do
    let(:user) { User.create(name: 'Martin') }
    let(:post) { Post.create(author: user, title: 'Test Post') }

    describe 'GET #index' do
      before do
        get user_posts_path(user)
      end

      it 'renders a successful response' do
        expect(response).to be_successful
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'response body includes the right placeholders' do
        expect(response.body).to include('Here is a list of posts for a given user')
      end
    end

    describe 'GET #show' do
      before do
        get user_post_path(user, post)
      end

      it 'renders a successful response' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end

      it 'response body includes the right placeholders' do
        expect(response.body).to include('Here is a given of posts for a given user')
      end
    end
  end
end
