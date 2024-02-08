module NoAdmin
  class ProfileController < ApiController
    def show
      user = current_user

      render status: 200, json: { user: Profile::UserSerializer.as_json(user) }
    end

    def update
      user = User::List::UpdateItem.call(id: params[:id], params: user_params)

      render status: 200, json: { user: Profile::UserSerializer.as_json(user), message: 'User was updated with success.' }
    end

    def destroy
      user = User::List::DeleteItem.call(current_user.id)

      render status: 200, json: { message: 'User was deleted with success.' }
    end

    private

    def user_params
      Profile::UserParams.call(params)
    end
  end
end
