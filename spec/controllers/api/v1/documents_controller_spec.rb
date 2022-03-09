require 'rails_helper'

RSpec.describe Api::V1::DocumentsController, type: :controller do
  describe 'GET #index' do
    let(:subject) { create(:document) }

    context 'successful responses' do
      login_admin
      it 'returns all posts when user is authorized' do
        get :index, params: { body: subject.body }

        expect(response.status).to eq(200)
        expect(response.parsed_body).to eq([subject.as_json])
      end
    end

    context 'unsuccessful responses' do
      context 'not authenticated' do
        it 'responds with not authorized when they are not logged in' do
          request.headers['REQUEST_PATH'] = api_v1_documents_path
          get :create, params: { body: subject.body }

          expect(response.status).to eq(401)
        end
      end

      context 'not authorized' do
        login_user

        it 'redirects user when they are not logged in' do
          get :create, params: { body: subject.body }

          expect(response.status).to eq(401)
        end
      end
    end
  end

  describe 'GET #show' do
    context 'successful responses' do
      context 'admin' do
        login_admin

        let(:subject) { create(:document, users: [User.first]) }
        let(:document_two) { create(:document) }

        it 'can view their own post' do
          get :show, params: { id: subject.id }

          expect(response.status).to eq(200)
          expect(response.parsed_body).to eq(subject.as_json)
        end

        it 'can view another post' do
          get :show, params: { id: document_two.id }

          expect(response.status).to eq(200)
          expect(response.parsed_body).to eq(document_two.as_json)
        end
      end

      context 'basic user' do
        login_user

        let(:subject) { create(:document, users: [User.first]) }

        it 'can view their own post' do
          get :show, params: { id: subject.id }

          expect(response.status).to eq(200)
          expect(response.parsed_body).to eq(subject.as_json)
        end
      end
    end

    context 'unsuccessful responses' do
      let(:subject) { create(:document) }

      it 'responds with not authorized when they are not logged in' do
        request.headers['REQUEST_PATH'] = api_v1_documents_show_path
        get :create, params: { id: subject.id }

        expect(response.status).to eq(401)
      end

      context 'basic user is not related to document' do
        login_user

        it 'can view their own post' do
          get :show, params: { id: subject.id }

          expect(response.status).to eq(401)
        end
      end
    end
  end
end
