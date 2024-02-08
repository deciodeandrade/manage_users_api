class User::List::UpdateItem
  def self.call(id:, params:)
    user = User::List::FindItem.call(id)
    
    changed = user.update(params)

    [changed, user]
  end
end
