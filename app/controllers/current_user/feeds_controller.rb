class CurrentUser::FeedsController < ApplicationController
	def index
		session[:user] = params[:user_id]
		@user = User.find(params[:user_id])
	end
	
	def new
		@feed = Feed.new
		@user = User.find(params[:user_id])
	end
	
	def create
		@feed = Feed.create(feed_params)
		@feed.user_id = params[:user_id]
		@user = User.find(params[:user_id])
		
		if @feed.save
			redirect_to individual_feeds_path
		else
			render 'new'
		end
	end
	
	def destroy
		@feed = Feed.find(params[:id])
		@feed.destroy
		
		redirect_to individual_feeds_path
	end
	
	def entries
		@user = User.find(params[:user_id])
		@feed = @user.feeds.find(params[:feed_id])
	end
	
	private
		def feed_params
			params.require(:feed).permit(:name, :description, :user_id)
		end
end
