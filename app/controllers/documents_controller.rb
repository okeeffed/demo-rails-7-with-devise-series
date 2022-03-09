class DocumentsController < ApplicationController
  def create
    @doc = Document.new(body: params[:body])
    @doc.save!

    render json: @doc, status: :created
  end

  def index
    @docs = Document.all
    render json: @docs
  end

  def update
    @doc = Document.find(params[:id])
    @doc.update!(document_params)
    render json: @doc
  end

  def destroy
    @doc = Document.find(params[:id])
    @doc.destroy
    render status: :no_content
  end
end
