class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :username, presence: true, length: { minimum: 3, maximum: 255 }
  validates_uniqueness_of :username, case_sensitive: false
end
