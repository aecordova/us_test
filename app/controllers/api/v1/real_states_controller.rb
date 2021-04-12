class Api::V1::RealStatesController < ApplicationController
  def create
    real_state = RealState.new(real_state_params)

    if real_state.save
      render json: { data: real_state }, status: :created
    else
      render json: { errors: real_state.errors }, status: :unprocessable_entity
    end
  end

  private

  def real_state_params
    params.require(:real_state).permit(
      :name, :property_type, :street, :external_number, :internal_number,
      :neighborhood, :city, :country, :rooms, :bathrooms, :comments
    )
  end
end
