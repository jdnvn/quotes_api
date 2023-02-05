class HighlightsController < ApplicationController
  def index
    # TODO: filter highlights
    render json: Highlight.includes(:book).all, status: :ok
  end

  def show
    @highlight = Highlight.find_by(id: params[:id])

    if highlight
      render json: highlight, status: :ok
    else
      render json: { error: "Could not find that highlight anywhere..." }, status: :not_found
    end
  end

  def create
    result = Highlights::Create.new(attributes: params).call

    if result.success?
      render json: result.value, status: :created
    else
      render json: result.error, status: :unprocessable_entity
    end
  end

  def destroy
    Highlight.find_by(id: params[:id]).destroy!

    render status: :no_content
  end
end
