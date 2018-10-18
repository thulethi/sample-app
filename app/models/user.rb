class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :active_relationships,   class_name: "Relationship",
                                    foreign_key: "follower_id",
                                    dependent: :destroy
  has_many :passive_relationships,  class_name: "Relationship",
                                    foreign_key: "followed_id",
                                    dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  before_save :downcase_email

  validates :name,      presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email,     presence: true, length: { maximum: 250 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password,  length: { minimum: 6 }

  # Return a user's status feed
  def feed
    following_ids = "SELECT followed_id FROM relationships
                              WHERE   follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids})
                    OR user_id = :user_id", user_id: id)
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
    # !active_relationships.find_by(followed_id: other_user.id).nil?
  end

  private

    def downcase_email
      self.email = email.downcase
    end
end
