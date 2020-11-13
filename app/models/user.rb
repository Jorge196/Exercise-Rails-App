class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :validatable
    has_many :exercise_logs 
    has_many :exercises, -> { distinct }, through: :exercise_logs 
    validates :email, presence: true, uniqueness: true
    validates :user_name, presence: true  
end
