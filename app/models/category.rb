class Category < ApplicationRecord
  has_and_belongs_to_many :articles, -> { order(created_at: :desc) }
end
