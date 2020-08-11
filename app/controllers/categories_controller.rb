class CategoriesController < ApplicationController
  def index
    # Maybe this should be converted to a join and a group by
    # Since we can't eager load and limit the loaded articles for each category to 1 at the same time.
    @categories = Category.preload(:articles).order(:priority).all
  end
end
