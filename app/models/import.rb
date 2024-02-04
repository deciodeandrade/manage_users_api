class Import < ApplicationRecord
  self.abstract_class = true

  validates :file, presence: true

  enum status: { pending: 'pending', started: 'started', finished: 'finished' }

  def load_data_on_database!
    raise NotImplementedError
  end
  
  def attempts
    successful + failed
  end
  
  def details
    {status: status, results: {attempts: attempts, successful: successful, failed: failed}}
  end

  def file_url
    Rails.application.routes.url_helpers.rails_blob_url(file, only_path: true)
  end

  def file_path
    ActiveStorage::Blob.service.path_for(file.key)
  end
  
end
