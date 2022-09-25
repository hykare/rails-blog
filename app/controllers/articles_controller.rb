class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  # make an instance variable for whatever needs to be passed to view
  def show
    @article = Article.find params[:id]
  end

  # makes a new article, doesn't save it to database
  # renders app/views/articles/new.html.erb
  def new
    # why does the view need this variable? to allow for sharing with create?
    @article = Article.new
  end

  def create
    @article = Article.new article_params

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]

    if @article.update article_params
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find params[:id]
    @article.destroy

    # 303 See Other
    # redirects to something other than the resource
    # eg confirmation page, upload progress
    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
