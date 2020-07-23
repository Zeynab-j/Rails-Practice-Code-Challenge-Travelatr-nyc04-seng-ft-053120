class Blogger < ApplicationRecord
  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 30 }

  has_many :destinations
  has_many :posts, through: :destinations
end
