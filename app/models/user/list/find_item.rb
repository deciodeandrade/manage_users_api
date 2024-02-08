class User::List::FindItem
  def self.call(id)
    User.find_by(id: id)
  end
end
