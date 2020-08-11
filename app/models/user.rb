class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :username, presence: true, length: { minimum: 3, maximum: 255 }, uniqueness: true
end
