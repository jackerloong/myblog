class CategoriesController < ApplicationController
  def show
  	category = Category.find(params[:id])
  	@articles = category.article
  	@categories = Category.all
  	@posts = Article.all
  	if @posts.length > 10
  		@posts = @posts[1..10]
  	end 
  end
end
