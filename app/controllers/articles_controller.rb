class ArticlesController < ApplicationController
	before_action :find_article,except: [:index,:new,:create]
	before_action :authenticate_user!,except: [:index,:show]
	def index
		@articles = Article.all.order("created_at DESC")
	end

	def new
		@article = current_user.articles.build
	end

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			flash[:success] = "Article successfully created !"
			redirect_to article_path(@article)
		else
			flash[:danger] = "Article failed to create !"
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @article.update(article_params)
			flash[:success] = "Article successfully updated !"
			redirect_to article_path(@article)
		else
			flash[:danger] = "Article failed to update !"
			render 'edit'
		end
	end

	def destroy
		@article.delete
		redirect_to root_path
		flash[:danger] = "Article successfully deleted !"
	end

	private

	def article_params
		params.require(:article).permit(:title,:content,:image,:remove_image)
	end

	def find_article
		@article = Article.find(params[:id])
	end
end
