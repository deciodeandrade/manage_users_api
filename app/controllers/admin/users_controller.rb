module Admin
  class UsersController < ApiController
    def show
      user = User.find(params[:id])

      user_json = Users::Serializer.as_json(user)

      render status: 200, json: { user: user_json }
    end

    def index
      users = User.all

      users_json = Users::Serializer.collection_as_json(users)

      render status: 200, json: { users: users_json }
    end

    def create
      user = User.new
      user.attributes = user_params
      user.save!

      user_json = Users::Serializer.as_json(user)

      render status: 200, json: { user: user_json }
    end

    def update
      user = User.find(params[:id])
      user.attributes = user_params
      user.save!

      user_json = Users::Serializer.as_json(user)

      render status: 200, json: { user: user_json }
    end

    def destroy
      user = User.find(params[:id])
      user.destroy!
    end

    private

    def user_params
      return {} unless params.has_key?(:user)
      params.require(:user).permit(:id, :full_name, :email, :password, :password_confirmation, :role, :avatar_image)
    end
  end
end
