require 'rails_helper'

RSpec.describe DocumentsController, type: :controller do
  describe 'GET #index' do
    let(:subject) { create(:document) }

    context 'successful responses' do
      login_user
      it 'returns all posts when user is authorized' do
        get :index, params: { body: subject.body }

        expect(response.status).to eq(200)
        expect(response.parsed_body).to eq([subject.as_json])
      end
    end

    context 'unsuccessful responses' do
      it 'redirects user when they are not logged in' do
        get :create, params: { body: subject.body }

        expect(response.status).to eq(302)
      end
    end
  end
end
