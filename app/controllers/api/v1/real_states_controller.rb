# frozen_string_literal: true

module Api
  module V1
    class RealStatesController < ApplicationController
      def index
        all_real_states
      end

      def show
        render json: { data: real_state }, status: :ok
      end

      def create
        real_state = RealState.new(real_state_params)

        if real_state.save
          render json: { data: real_state }, status: :created
        else
          render json: { errors: real_state.errors }, status: :unprocessable_entity
        end
      end

      def update
        if real_state.update(real_state_params)
          render json: { data: real_state }, status: :ok
        else
          head :unprocessable_entity
        end
      end

      def destroy
        if real_state.destroy
          head :ok
        else
          head :unprocessable_entity
        end
      end

      private

      def real_state_params
        params.require(:real_state).permit(
          :name, :property_type, :street, :external_number, :internal_number,
          :neighborhood, :city, :country, :rooms, :bathrooms, :comments
        )
      end

      def real_state
        @real_state = RealState.find(params[:id])
      end

      def all_real_states
        @all_real_states = RealState.all
      end
    end
  end
end
