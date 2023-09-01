require 'swagger_helper'

describe 'Users API' do
  before(:each) do
    # Create a user for testing
    @user = User.create(
      name: 'Test User',
      bio: 'Test Bio',
      email: 'test@example.com',
      role: nil
    )
  end

  path '/api/v1/users' do
    get 'Retrieves all Users' do
      tags 'Users'
      produces 'application/json'
  
      response '200', 'Users found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              name: { type: :string },
              bio: { type: :string },
              email: { type: :string },
              role: { type: %i[string null] }
            },
            required: ['id', 'name', 'bio', 'email']
          }
        let!(:user) { User.create(
            name: 'Test User',
            bio: 'Test Bio',
            email: 'test@example.com',
            role: nil
        ) }  

        run_test!
      end
  
      response '404', 'Users not found' do
        run_test!
      end
    end
  end
end
