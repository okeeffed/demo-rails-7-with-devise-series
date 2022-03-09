class DocumentsController < ApplicationController
  include Pundit::Authorization

  def index
    @docs = Document.all
    authorize @docs

    render json: @docs
  end

  def create
    @doc = Document.new(body: params[:body])
    authorize @doc

    @doc.save!

    render json: @doc, status: :created
  end

  def show
    @doc = Document.find(params[:id])
    authorize @doc

    render json: @doc
  end

  def update
    @doc = Document.find(params[:id])
    authorize @doc

    @doc.update!(document_params)

    render json: @doc
  end

  def destroy
    @doc = Document.find(params[:id])
    authorize @doc

    @doc.destroy

    render status: :no_content
  end

  private

  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def document_params
    params.require(:document).permit(:body)
  end
end
