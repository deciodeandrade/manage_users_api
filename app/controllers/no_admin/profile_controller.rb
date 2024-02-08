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
        head :no_content
      else
        render status: 422, json: { user: Profile::UserSerializer.as_json(user) }
      end
    end

    private

    def user_params
      Profile::UserParams.call(params)
    end
  end
end
