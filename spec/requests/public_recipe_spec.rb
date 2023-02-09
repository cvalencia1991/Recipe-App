require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :request do
  describe 'GET /all' do
    it 'returns http success' do
      get '/public_recipe/all'
      expect(response).to have_http_status(:success)
    end
  end
end
