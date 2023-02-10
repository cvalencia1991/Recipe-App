require 'rails_helper'
require 'support/controller_macros'

RSpec.describe FoodsController, type: :request do

  describe 'GET /index' do
    it 'renders a successful response' do
      get '/users/1/recipes/1/foods'
      expect(response).to have_http_status(302)
     end
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get '/users/1/recipes/1/foods/new'
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /edit' do
    let(:valid_attributes) {{ :name => "pasta", :measuement_unit => "2okg", :price => 20, :quantity =>20, :user_id => 1 }}
    it 'renders a successful response' do
      get '/users/1/recipes/1/foods/1/edit'
      expect(response).to have_http_status(302)
    end
  end
