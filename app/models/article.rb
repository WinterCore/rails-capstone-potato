class Article < ApplicationRecord
  belongs_to :author, class_name: User.name
  has_and_belongs_to_many :categories
  has_many :votes
  has_many :voters, through: :votes, source: :user

  scope :belong_to_category, lambda { |category|
    joins(:categories).where(categories: { id: category }) unless category.nil?
  }

  scope :most_voted, lambda {
    select('articles.*, COUNT(votes.user_id) as votes_count')
      .left_joins(:votes)
      .group(:id)
      .order(votes_count: :desc)
  }

  def image_url=(url)
    write_attribute(:image, url)
  end

  def image=(image)
    extension = File.extname(image)
    path = File.join('uploads', "#{Time.now.to_i}_#{Random.rand(1e9)}#{extension}")
    File.open(Rails.root.join('public', path), 'wb') do |file|
      file.write(image.read)
    end
    super(path)
  end

  validates :title, :text, :image, presence: true
  validates :title, length: { minimum: 3, maximum: 255 }
  validates :category_ids, presence: true
end
