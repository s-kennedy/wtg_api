class User < ApplicationRecord
  has_secure_password
  has_many :guides, dependent: :destroy

  validates :name, presence: true, length: { in: 2..255 }
  validates :email, uniqueness: { case_sensitive: false }, presence: true, length: { in: 2..255 }
end
