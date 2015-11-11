class CommentsController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		@user = User.find_by_auth_token(cookies[:auth_token])
		@comment = @article.comments.create(comment_params)
		@comment.user_id = @user.id
		@comment.save
		redirect_to article_path(@article)
	end

	## 解决不了获取user, 先增加一个字段算了
	def show
		@comment = Comment.find(params[:id])
	end
		
	private
		def comment_params
			params.require(:comment).permit(:body)
		end
end

