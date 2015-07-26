require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:products)).not_to be_nil
    end
  end
  describe 'POST create' do
    describe 'create: OK' do
      it('create: create catalog') do
        post :create, product: {name: 'name', description: 'desc', price: 1.10, catalog_id: 1}
        expect(assigns(:product).errors).to be_empty
        expect(assigns(:product).valid?).to be_truthy
      end
    end
  end
  describe 'DELETE destroy' do
    describe 'destroy: OK' do
      it 'changed status' do
        expect(response).to have_http_status(:success)
      end
    end
  end

end
