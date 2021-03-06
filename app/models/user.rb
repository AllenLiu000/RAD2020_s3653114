class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :actives
  has_many :comments
  has_many :verifications
  
  attr_accessor :remember_token
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    
    has_secure_password
    validates :password, presence: true, length: { in: 8..20 }, allow_nil: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "no special characters allowed."}
    
    validates :mobile, presence: true, length: { in: 10..13 }, format: { with: /\A\d+\z/, message: "integer only." }

    validates :city, presence: true

    mount_uploader :avatar, PictureUploader

    validate  :avatar_size

    # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

   # Returns a random token.
   def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Defines a proto-feed.
  # See "Following users" for the full implementation.
  def feed
    Micropost.where("user_id = ?", id)
  end

  private

    # Validates the size of an uploaded picture.
    def avatar_size
      if avatar.size > 2.megabytes
        errors.add(:avatar, "should be less than 2MB")
      end
    end
end
