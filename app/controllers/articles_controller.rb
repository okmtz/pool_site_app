# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i[show edit update destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.user(current_user).order(created_at: 'DESC')
  end

  # GET /articles/1
  # GET /articles/1.json
  def show; end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles
  # POST /articles.json
  def create
    Article.create_with_url_content(article_params)
    redirect_to articles_path
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    Article.update_with_url_content(article_params, @article)
    redirect_to articles_path
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:url, :check, :comment, :user_id)
  end
end
