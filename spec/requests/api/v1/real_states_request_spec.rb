require 'rails_helper'
require 'rspec/json_expectations'

RSpec.describe 'Api::V1::RealStates', type: :request do
  describe 'real state #create' do
    before { post '/api/v1/real_states', params: params }

    context 'with valid_information' do
      let(:params) { { real_state: attributes_for(:real_state) } }

      it 'creates a real state record' do
        created_record_id = json_response.dig('data', 'id')

        expect(RealState.find(created_record_id)).to_not be nil
      end

      it 'contains the attributes of the created record on the response body' do
        expected_attributes = attributes_for(:real_state)
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
            external_number: "!@\#$#",
            internal_number: "@#{$@}%",
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

  def json_response
    JSON.parse(response.body)
  end
end
