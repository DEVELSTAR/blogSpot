class ArticlesController < ApplicationController

  def index(sorting = :id)
    @articles = Article.paginate(page: params[:page], per_page: 2)
    # @articles = Article.all
    # if sorting === :id
    #   @articles
    # end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = "Article created successfully"
      redirect_to @article
    else
      flash.now[:error] = "Article was not created"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end


  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :cover)
    end

end