class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [ :admin, :user ]

  validates :email, presence: true
  validates :password, presence: true, if: :new_record?
  validates :role, presence: true, inclusion: { in: roles.keys }
end
