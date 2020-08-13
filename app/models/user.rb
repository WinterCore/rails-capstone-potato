class User < ApplicationRecord
  has_many :articles, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :votes
  has_many :voted_articles, through: :votes, source: :article

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :username, presence: true, length: { minimum: 3, maximum: 255 }
  validates_uniqueness_of :username, case_sensitive: false
end
