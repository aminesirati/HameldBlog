class CommentsController < ApplicationController
	before_action :find_comment,except: [:create]
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		if @comment.save
			flash[:success] = "Comment successfully created !"
			redirect_to article_path(@article)
		else
			flash[:danger] = "Comment failed to create !"
			render '_form'
		end
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
			flash[:success] = "Comment successfully updated !"
			redirect_to article_path(@article)
		else
			flash[:danger] = "Comment failed to update !"
			render 'edit'
		end
	end

	def destroy
		@comment.delete
		redirect_to article_path(@article)
		flash[:danger] = "Comment successfully deleted !"
	end

	private

	def find_comment
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:body)
	end
end
