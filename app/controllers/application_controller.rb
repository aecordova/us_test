# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from(ActiveRecord::RecordNotFound, with: :handle_not_found)

  private

  def handle_not_found(e)
    render json: { errors: e.message }, status: :not_found
  end
end
