class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # Visualização de todos os artigos
  def index
    @articles = Article.all.reverse
  end

  # Visualização de um artigo
  def show
  end

  # Visualização da página de criação
  def new
    @article = Article.new
  end

  # Visualização da página de edição de artigo
  def edit
  end

  # Action de criação do artigo
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article # Redirecionamento para o show do artigo
    else
      render "new", status: :unprocessable_entity # Erro de processamento
    end
  end

  # Action de atualização de artigo
  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render "edit", status: :unprocessable_entity # Erro de processamento
    end
  end

  # Deleta o registro de um artigo
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :content)
  end
end
