class ArticlesController < ApplicationController
  before_action :set_categories, only: [:new]
  before_action :authenticate, only: %i[new create vote]

  def index
    @articles = Article.belong_to_category(params[:category]).most_voted
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

  def vote
    if current_user.votes.exists?(article_id: params[:article_id])
      flash[:alert] = 'You have already voted for this article!'
    else
      current_user.voted_articles << Article.find(params[:article_id])
      flash[:notice] = 'Vote added successfully.'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end

  def set_categories
    @categories = Category.pluck('name', 'id')
  end
end
