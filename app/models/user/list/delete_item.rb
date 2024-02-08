class User::List::DeleteItem
  def self.call(id)
    user = User::List::FindItem.call(id)
    user.destroy

    [user.destroyed?, user]
  end
end
