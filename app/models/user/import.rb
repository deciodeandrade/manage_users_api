class User::Import < Import
  require 'csv'

  self.table_name = 'imports'

  has_one_attached :file

  has_many :users

  def load_data_on_database!
    self.update(status: :started)

    errors = []
    successful, failed = 0, 0

    CSV.foreach(file_path, headers: true) do |row|
      begin
        user_params = row.to_h
        User.create!(user_params)
        successful += 1
      rescue StandardError => e
        failed += 1
        errors.push({user_params: user_params, error: e})
      end
      self.update(successful: successful, failed: failed)
    end

    self.update(status: :finished)

    {details: details, errors: errors}
  end
end
