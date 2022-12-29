class User < ApplicationRecord
  has_secure_password

  mount_uploader :image, UserImageUploader

  validates :token, presence: true, uniqueness: { case_sensitive: true }
  validates :address, presence: true, uniqueness: { case_sensitive: true }

  has_many :vrms, dependent: :destroy
end
