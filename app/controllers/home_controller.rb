class HomeController < ApplicationController
  def index; end

  def create
    render json: { message: 'Welcome to the API' }
  end
end
