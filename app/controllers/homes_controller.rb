class HomesController < ApplicationController
  def index
    render json: { message: "Welcome to our application. It's good to see you here!" }
  end
end
