class ArticlesController < ApplicationController

	before_action :set_article, only: [:edit, :update, :show, :destroy]

	def new
		@article = Article.new
	end

	def create
		# render plain: params[:article].inspect
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article was successfully created"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def do_something
		@example = Article.first
	end



	def show

	end

	def edit

	end

	def update

		if @article.update(article_params)
			flash[:notice] = "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def index
		@articles = Article.all
	end

	def destroy

		@article.destroy
		flash[:notice] = "Article successfully destroyed"
		redirect_to articles_path
	end

	private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :description, :author)
	end


end
