require 'rails_helper'

RSpec.describe CatalogsController, type: :controller do

    describe 'GET index' do
      before(:each) { get :index }
      it('index: is find required catalogs') { expect(assigns(:catalogs)).not_to be_nil }
    end
    describe 'GET new' do
      before(:each) { get :new }
      it 'new: is build new catalog & lot' do
        expect(assigns(:catalog)).not_to be_nil
      end
    end
    describe 'GET edit' do
      describe 'edit: OK' do
        before(:each) { get :edit, id: 1 }
        it('edit: is render template'){ expect(response).to render_template 'edit' }
      end
    end
    describe 'POST create' do
      describe 'create: OK' do
        it('create: create catalog') do
          post :create, catalog: {name: 'name', description: 'desc'}
          expect(assigns(:catalog).errors).to be_empty
          expect(assigns(:catalog).valid?).to be_truthy
          expect(response).to redirect_to catalogs_path
        end
      end
      describe 'create: no OK' do
        it('create: no create catalog') do
          post :create, catalog: {name: '', description: ''}
          expect(assigns(:catalog).errors).not_to be_empty
          expect(response).to redirect_to new_catalog_path
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