require 'faker'

module ModelHelpers
  def article_data
    {
      title: Faker::Lorem.sentence,
      text: Faker::Lorem.paragraph,
      image: Faker::LoremPixel.image
    }
  end

  def user_data
    {
      username: Faker::Name.first_name,
      name: Faker::Name.name
    }
  end

  def category_data
    {
      name: Faker::Lorem.sentence,
      image: Faker::LoremPixel.image,
      priority: Faker::Number.between(from: 1, to: 1000)
    }
  end

  def comment_data
    {
      content: Faker::Lorem.paragraph
    }
  end
end
