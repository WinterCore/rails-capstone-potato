module HomeHelper
  def category_article_title(category)
    limit_text(category.articles.first.title, 40) if category.articles.size.positive?
  end

  def category_article_image(category)
    if category.articles.size.positive?
      category.articles.first.image
    else
      category.image
    end
  end
end
