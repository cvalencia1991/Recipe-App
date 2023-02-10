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
      food = Food.create! valid_attributes
      get '/users/1/recipes/1/foods/1/edit'
      expect(response).to have_http_status(302)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) {{ :id=> 1, :name => "pasta", :measuement_unit => "20kg", :price => 20, :quantity =>20, :user_id => 1 }}
      it 'creates a new Food' do
        expect do
          post '/users/1/recipes/1/foods', params: { food: valid_attributes }
        end.to change(Food, :ids).by(1)
        end
      end
    end
  # describe 'PATCH /update' do
  #   context 'with valid parameters' do
  #     let(:new_attributes) do
  #       skip('Add a hash of attributes valid for your model')
  #     end

  #     it 'updates the requested food' do
  #       food = Food.create! valid_attributes
  #       patch food_url(food), params: { food: new_attributes }
  #       food.reload
  #       skip('Add assertions for updated state')
  #     end

  #     it 'redirects to the food' do
  #       food = Food.create! valid_attributes
  #       patch food_url(food), params: { food: new_attributes }
  #       food.reload
  #       expect(response).to redirect_to(food_url(food))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it "renders a response with 422 status (i.e. to display the 'edit' template)" do
  #       food = Food.create! valid_attributes
  #       patch food_url(food), params: { food: invalid_attributes }
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end
  #   end
  # end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested food' do
  #     food = Food.create! valid_attributes
  #     expect do
  #       delete food_url(food)
  #     end.to change(Food, :count).by(-1)
  #   end

  #   it 'redirects to the foods list' do
  #     food = Food.create! valid_attributes
  #     delete food_url(food)
  #     expect(response).to redirect_to(foods_url)
  #   end
  # end
