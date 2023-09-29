# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :stores, dependent: :destroy

  # Associações
  has_many :stores

  # Validações
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # Bcrypt
  #has_secure_password

end