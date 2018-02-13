require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET #index' do
    it 'returns a success reponse' do
      get :index
      expect(response).to be_success # response.success?

    end
  end
  context 'GET #show' do
    it 'returns a success reponse' do
      user = User.create(lastname:'Last', email:'last@last.fr', firstname:'first')
      get :show, params: {id: user.to_param }
      expect(response).to be_success # response.success?
    end
  end
end
