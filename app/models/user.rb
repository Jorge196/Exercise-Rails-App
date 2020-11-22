class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :validatable, :recoverable, :rememberable, :omniauthable, omniauth_providers: [:google_oauth2]
    has_many :exercise_logs 
    has_many :exercises, -> { distinct }, through: :exercise_logs 
    validates :email, presence: true, uniqueness: true
    validates :user_name, presence: true 
    
  def self.from_google(uid:, email:, full_name:, avatar_url:)
    if user = User.find_by(email: email)
      user.update(uid: uid, full_name: full_name, avatar_url: avatar_url) unless user.uid.present?
      user
    else
      User.create(
        email: email,
        uid: uid,
        full_name: full_name,
        avatar_url: avatar_url,
        password: SecureRandom.hex
      )
    end
    user.update(uid: uid, full_name: full_name, avatar_url: avatar_url)
  end
end
