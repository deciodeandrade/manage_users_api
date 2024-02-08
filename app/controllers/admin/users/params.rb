module Admin
  class Users::Params
    def self.call(params)
      return {} unless params.has_key?(:user)
      params.require(:user).permit(
        :id,
        :full_name,
        :email,
        :password,
        :password_confirmation,
        :role,
        :avatar_image
      )
    end
  end
end
