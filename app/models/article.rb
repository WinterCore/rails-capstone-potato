class Article < ApplicationRecord
  belongs_to :author, class_name: User.name
  has_and_belongs_to_many :categories
  has_many :votes
  has_many :voters, through: :votes, source: :user
  has_many :comments, -> { order(created_at: :desc) }

  scope :belong_to_category, lambda { |category|
                               joins(:categories).where(categories: { id: category }) unless category.nil?
                             }
  scope :with_votes, -> { select('articles.*, COUNT(votes.user_id) as votes_count').left_joins(:votes).group(:id) }
  scope :most_voted, -> { with_votes.order(votes_count: :desc) }

  def image_file=(image)
    if image.instance_of?(ActionDispatch::Http::UploadedFile)
      extension = File.extname(image)
      path = File.join('uploads', "#{Time.now.to_i}_#{Random.rand(1e9)}#{extension}")
      File.open(Rails.root.join('public', path), 'wb') do |file|
        file.write(image.read)
      end
      write_attribute(:image, "/#{path}")
    elsif image.is_a?(String)
      write_attribute(:image, image)
    end
  end

  validates :title, :text, :image, :category_ids, presence: true
  validates :title, length: { minimum: 3, maximum: 255 }
end
