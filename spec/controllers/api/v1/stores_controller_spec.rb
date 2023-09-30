# spec/controllers/api/v1/stores_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::V1::StoresController, type: :controller do
  let(:user) { create(:user) } # Certifique-se de ter um factory para o modelo User
  let(:store) { create(:store, user: user) } # Certifique-se de ter um factory para o modelo Store

  before do
    allow(controller).to receive(:authenticate_api_user!).and_return(true)
    allow(controller).to receive(:current_api_user).and_return(user)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: store.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'creates a new store' do
      store_params = { name: 'New Store', user_id: user.id }
      post :create, params: { store: store_params }
      expect(response).to have_http_status(:created)
    end

    it 'returns errors if invalid params are provided' do
      post :create, params: { store: { name: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH #update' do
    it 'updates an existing store' do
      updated_name = 'Updated Store'
      patch :update, params: { id: store.id, store: { name: updated_name } }
      expect(response).to have_http_status(:ok)
      expect(store.reload.name).to eq(updated_name)
    end

    it 'returns errors if invalid params are provided' do
      patch :update, params: { id: store.id, store: { name: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys an existing store' do
      delete :destroy, params: { id: store.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end
