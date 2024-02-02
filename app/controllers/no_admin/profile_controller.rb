module NoAdmin
  class ProfileController < ApiController
    def show
      render status: 200, json: 'Show!'
    end

    def update
      render status: 200, json: 'Update!'
    end

    def destroy
      render status: 200, json: 'Destroy!'
    end
  end
end
