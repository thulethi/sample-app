class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  before_save { self.email = email.downcase }
  # scope :active_users, -> { where(active: true) }
  # scope :inactive_users, -> { where(active: false) }

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 250 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  # Define a proto-feed
  def feed
    Micropost.where("user_id = ?", id)
    # OR microposts
  end
end
