module NoAdmin
  class HomeController < ApiController
    def index
      render status: 200, json: 'Hello NoAdmin!'
    end
  end
end
