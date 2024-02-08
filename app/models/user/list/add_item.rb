class User::List::AddItem
  def self.call(params)
    user = User.create(params)

    [user.persisted?, user]
  end
end
