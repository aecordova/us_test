# frozen_string_literal: true

require 'rails_helper'
require 'rspec/json_expectations'

RSpec.describe 'Api::V1::RealStates', type: :request do
  describe 'real state #create' do
    before { post '/api/v1/real_states', params: params }

    context 'with valid_information' do
      let(:expected_attributes){ attributes_for(:real_state) }
      let(:params) { { real_state: expected_attributes } }

      it 'creates a real state record' do
        created_record_id = json_response.dig('data', 'id')

        expect(RealState.find(created_record_id)).to_not be nil
      end

      it 'contains the attributes of the created record on the response body' do
        expect(json_response['data']).to include_json(expected_attributes)
      end

      it 'responds with a :created status code' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid information' do
      let(:params) do
        {
          real_state: {
            name: nil,
            property_type: 'house',
            street: 'some_random_street',
            external_number: "!@$#",
            internal_number: "@#%",
            neighborhood: 'some_hood',
            city: 'some_city',
            country: 'XX',
            rooms: 'meep',
            bathrooms: 'meep',
            comments: 'Oh man! I think I messed up...'
          }
        }
      end

      it 'responds with status :unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'contains the list of errors in the body' do
        expected_errors = {
          name: ["can't be blank"],
          external_number: ['only allows alfanumeric and dashes'],
          internal_number: ['only allows alfanumeric, dashes and spaces'],
          country: ['is not included in the list'],
          rooms: ['is not a number'],
          bathrooms: ['is not a number']
        }
        expect(json_response['errors']).to include_json(expected_errors)
      end
    end
  end

  describe 'real state #update' do
    before { patch "/api/v1/real_states/#{property.id}", params: params }
    let(:expected_attributes){attributes_for(:real_state)}
    let(:property) { create(:real_state, expected_attributes) }

    context 'with valid_information' do
      let(:params) { { real_state: { name: 'new_property_name' } } }

      it 'updates record' do
        expect(property.reload.name).to eql('new_property_name')
      end

      it 'contains the attributes of the created record on the response body' do
        expect(json_response['data']).to include_json(
          expected_attributes.merge(name: 'new_property_name')
        )
      end

      it 'responds with a :ok status code' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid information' do
      let(:params) do
        {
          real_state: {
            external_number: "!@\#$#"
          }
        }
      end

      it 'responds with status :unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'real_state #show' do
    let(:expected_attributes){attributes_for(:real_state)}
    let(:property) { create(:real_state, expected_attributes) }

    context 'with a valid id in params' do
      before { get "/api/v1/real_states/#{property.id}" }

      it 'returns the requested record information' do
        expect(json_response['data']).to include_json(expected_attributes)
      end
    end

    context ' with an invalid_id in params' do
      before { get '/api/v1/real_states/meep' }
      it 'responds with status: not_found' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'real_state #index' do
    let(:attributes) { attributes_for(:real_state) } 
    
    before do
      create(:real_state, attributes.merge(name: 'property 1'))
      create(:real_state, attributes.merge(name: 'property 2'))

      get '/api/v1/real_states', headers: { 'ACCEPT' => 'application/json' }
    end

    it 'returns a list of real states with certain attributes' do
      expected_object = { 'name' => 'property 1',
                          'property_type' => attributes[:property_type],
                          'city' => attributes[:city],
                          'country' => attributes[:country] }

      expect(json_response['data'].first).to match(expected_object)
      expect(json_response['data'].size).to eql(2)
    end
  end

  describe 'real_state #destroy' do
    let(:created_record_id) { create(:real_state).id }

    before { delete "/api/v1/real_states/#{created_record_id}", headers: { 'ACCEPT' => 'application/json' } }

    it 'deletes the record' do
      expect(RealState.find_by(id: created_record_id)).to be nil
    end
  end

  def json_response
    JSON.parse(response.body)
  end
end
