# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one_attached :avatar_image

  enum role: { admin: 'admin', no_admin: 'no-admin' }

  validates :full_name, presence: true
  validates :role, presence: true
  validates :avatar_image, presence: true

  def avatar_url
    return unless avatar_image.attached?
    
    Rails.application.routes.url_helpers.rails_blob_url(avatar_image, only_path: true)
  end
end
