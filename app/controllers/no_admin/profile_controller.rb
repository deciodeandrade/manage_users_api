module NoAdmin
  class ProfileController < ApiController
    def show
      user = current_user

      render status: 200, json: { user: Profile::UserSerializer.as_json(user) }
    end

    def update
      changed, user = User::List::UpdateItem.call(id: current_user.id, params: user_params)

      status = changed ? 200 : 422

      render status: status, json: { user: Profile::UserSerializer.as_json(user) }
    end

    def destroy
      destroyed, user = User::List::DeleteItem.call(current_user.id)

      if destroyed
        status = 200
        user_json = {}
      else
        status = 422
        user_json = Profile::UserSerializer.as_json(user)
      end

      render status: status, json: { user: user_json }
    end

    private

    def user_params
      Profile::UserParams.call(params)
    end
  end
end
