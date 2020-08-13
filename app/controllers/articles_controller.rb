class ArticlesController < ApplicationController
  before_action :set_categories, only: [:new]
  before_action :authenticate, only: %i[new create vote]

  def index
    @articles = Article
      .includes(:author)
      .belong_to_category(params[:category])
      .with_votes
      .order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to root_path, notice: 'Article created successfully!'
    else
      set_categories
      render 'new'
    end
  end

  def show
    @article = Article.includes(comments: :author).find(params[:id])
    @comment = Comment.new
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image_file, category_ids: [])
  end

  def set_categories
    @categories = Category.pluck('name', 'id')
  end
end
