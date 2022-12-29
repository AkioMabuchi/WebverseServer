class Vrm < ApplicationRecord
  belongs_to :user

  mount_uploader :body, VrmBodyUploader

  validates :token, presence: true, uniqueness: { case_sensitive: true }
  validates :name, presence: true
  validates :body, presence: true
end
