module NoAdmin
  class Profile::UserSerializer
    def self.as_json(user)
      return user.errors.as_json if user.errors.present?

      {
        id: user.id,
        full_name: user.full_name,
        email: user.email,
        role: user.role,
        avatar_url: user.avatar_url
      }
    end
  end
end
