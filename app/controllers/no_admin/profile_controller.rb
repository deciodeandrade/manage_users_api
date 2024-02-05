module NoAdmin
  class ProfileController < ApiController
    def show
      user = current_user

      user_json = Users::Serializer.as_json(user)

      render status: 200, json: { user: user_json }
    end

    def update
      user = current_user
      user.attributes = user_params
      user.save!

      user_json = Users::Serializer.as_json(user)

      render status: 200, json: { user: user_json }
    end

    def destroy
      user = current_user
      user.destroy!
    end

    private

    def user_params
      return {} unless params.has_key?(:user)
      params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :avatar_image)
    end
  end
end
