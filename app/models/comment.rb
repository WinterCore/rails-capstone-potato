class Comment < ApplicationRecord
  belongs_to :author, class_name: User.name
  belongs_to :article

  validates :content, presence: true
end
