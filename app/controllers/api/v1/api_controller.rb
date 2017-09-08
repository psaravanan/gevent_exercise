class Api::V1::ApiController < ApplicationController
  
  private

  def render_success(data, status = :ok)
    render json: {
      result: true,
      data: data
    }, status: status
  end

  def render_failed(data, status = :ok)
    render json: {
      result: false,
      data: data
    }, status: status
  end
  
end