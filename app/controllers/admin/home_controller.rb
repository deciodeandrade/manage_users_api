module Admin
  class HomeController < ApiController
    def index
      render status: 200, json: 'Hello Admin!'
    end
  end
end
