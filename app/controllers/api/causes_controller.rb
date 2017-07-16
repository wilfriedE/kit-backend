class Api::CausesController < ApplicationController
  def show
    render json: cause
  end

  private

  def cause
    return Cause.find(params[:id]) if params[:id]
    {}
  end
end
