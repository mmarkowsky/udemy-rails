class ArticlesController < ApplicationController
  before_action :set_article, only: [:show,:update,:destroy]


  def index
    @articles = Article.all
  end

  
  def new
    @article = Article.new
  end
  

  def create
    @article = Article.new(article_params)  
    if @article.save
      flash[:success] = "Article has been create"
      redirect_to articles_path
    else
      flash.now[:danger] = "The article was not created"
      render :new
    end
  end 

  def show
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article has been updated"
      redirect_to articles_path
    else
      flash.now[:danger] = "The article was not updated"
      render :show
    end  
  end

  def destroy
    if @article.destroy
      flash[:success] = "Article has been deleted"
      redirect_to articles_path
    else
      flash.now[:danger] = "The article was not deleted"
      render :show
    end  
  end
  
  protected
    def resources_not_found
      message = "The article you are looking for could not be found"
      flash[:alert] = message
      redirect_to root_path
    end

  private
    def set_article
      @article = Article.find(params[:id])  
    end
    
    def article_params
      params.require(:article).permit(:title,:body)
    end

end
