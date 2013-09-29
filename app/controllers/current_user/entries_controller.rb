class CurrentUser::EntriesController < ApplicationController
	def index
		@user = User.find(params[:user_id])
	end
	
	def new
		@entry = Entry.new
		@user = User.find(params[:user_id])
	end
	
	def create
		@entry = Entry.create(entry_params)
		@user = User.find(params[:user_id])
		
		if @entry.save
			redirect_to individual_entries_path
		else
			render 'new'
		end
	end
	
	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy
		
		redirect_to individual_entries_path
	end
	
	private
		def entry_params
			params.require(:entry).permit(:name, :url, :feed_id)
		end
end
