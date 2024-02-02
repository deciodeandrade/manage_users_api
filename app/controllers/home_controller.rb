class HomeController < ApplicationController
  def index
    render status: 200, json: 'Hello World!'
  end
end
