class ArticlesController < ApplicationController

	def index
		@articles = Article.all
		@categories = Category.all
		@posts = Article.all
	  	if @posts.length > 10
	  		@posts = @posts[1..10]
	  	end 
	end

	def show
		@article = Article.find(params[:id])
		@categories = Category.all
		@posts = Article.all
	  	if @posts.length > 10
	  		@posts = @posts[1..10]
	  	end
	end
end
