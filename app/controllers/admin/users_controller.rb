module Admin
  class UsersController < ApiController
    def show
      user = User.find(params[:id])

      json = {
        id: user.id,
        full_name: user.full_name,
        email: user.email,
        role: user.role
      }

      render status: 200, json: json
    end

    def index
      users = User.all

      json = users.map do |item|
        {
          id: item.id,
          full_name: item.full_name,
          email: item.email,
          role: item.role
        }
      end

      render status: 200, json: json
    end

    def create
      user = User.new
      user.attributes = user_params
      user.save!

      json = {
        id: user.id,
        full_name: user.full_name,
        email: user.email,
        role: user.role
      }

      render status: 200, json: json
    end

    def update
      user = User.find(params[:id])
      user.attributes = user_params
      user.save!

      json = {
        id: user.id,
        full_name: user.full_name,
        email: user.email,
        role: user.role
      }

      render status: 200, json: json
    end

    def destroy
      user = User.find(params[:id])
      user.destroy!
    end

    private

    def user_params
      return {} unless params.has_key?(:user)
      params.require(:user).permit(:id, :full_name, :email, :password, :password_confirmation, :role)
    end
  end
end
