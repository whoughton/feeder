class OverviewController < ApplicationController

	def index
		@users = User.all
	end
end
