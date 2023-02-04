class HighlightsController < ApplicationController
  def index
    render json: Highlight.all, status: :ok
  end

  def show
    highlight = Highlight.find_by(id: params[:id])

    if highlight
      render json: highlight
    else
      render json: { error: "Could not find that highlight anywhere..." }, status: :not_found
    end
  end

  def create
    result = Highlights::Create.new(attributes: params).call

    if result.success?
      render json: result.value, status: :ok
    else
      render json: result.error, status: :unprocessable_entity
    end
  end

  def delete
    Highlight.find_by(id: params[:id]).destroy!

    format.json { head :no_content }
  end
end
