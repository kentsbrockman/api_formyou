class User < ApplicationRecord
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable :recoverable, :rememberable, :validatable and :omniauthable

  include Devise::JWT::RevocationStrategies::Allowlist

  devise :database_authenticatable, :registerable,
  :jwt_authenticatable, jwt_revocation_strategy: self
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  has_many :assigned_courses, foreign_key: 'teacher_id', class_name: "Course"
  has_many :subscriptions, foreign_key: 'student_id', class_name: "Subscription"
  enum role: ["student", "admin", "teacher"]

end
