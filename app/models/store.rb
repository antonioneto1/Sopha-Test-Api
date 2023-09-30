class Store < ApplicationRecord

  # Associações
  belongs_to :user

  # Validações
  validates :name, presence: true
end
