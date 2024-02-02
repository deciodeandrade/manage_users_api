module Admin
  class UsersController < ApiController
    def show
      render status: 200, json: 'Show!'
    end

    def index
      render status: 200, json: 'Index!'
    end

    def create
      render status: 200, json: 'Create!'
    end

    def update
      render status: 200, json: 'Update!'
    end

    def destroy
      render status: 200, json: 'Destroy!'
    end
  end
end
