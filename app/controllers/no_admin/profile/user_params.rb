module NoAdmin
  class Profile::UserParams
    def self.call(params)
      return {} unless params.has_key?(:user)
      params.require(:user).permit(
        :full_name,
        :email,
        :password,
        :password_confirmation,
        :avatar_image
      )
    end
  end
end
