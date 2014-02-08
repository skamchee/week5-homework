class ComicsController < ApplicationController

	def index
		@comics = Comic.all
	end

	def show
		@comic = Comic.find_by(:id => params[:id])
	end

	def new
		@comic = nil
	end

	def create
		@comic = Comic.new
    	@comic.title = params["title"]
    	@comic.description = params["description"]
    	@comic.image = params["image"]
    	if(@comic.valid?)
	   	 	@comic.save
    	end
    	render "new" #send to a view
	end

	def delete
		c = Comic.find_by(:id => params[:id])
		c.destroy
		redirect_to "/" #send to a route
	end

end
