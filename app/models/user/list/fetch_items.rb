class User::List::FetchItems
  def self.call(params)
    User.all
  end
end
