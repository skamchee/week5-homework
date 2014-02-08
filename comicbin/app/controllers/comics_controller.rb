class ComicsController < ApplicationController

	def index
		@comics = Comic.all
	end

	def show
		@comic = Comic.find_by(:id => params[:id])
	end

	def new
		@formheader = "<div class='page-header'><h1>Add a New Comic</h1></div>"
		@comic = nil
	end

	def create
		@formheader = "<div class='page-header'><h1>Add a New Comic</h1></div>"
		comic = Comic.new
    	comic.title = params["title"]
    	comic.description = params["description"]
    	comic.image = params["image"]
	    comic.save
    	redirect_to "/"
	end

	def delete
		c = Comic.find_by(:id => params[:id])
		c.destroy
		redirect_to "/"
	end

end
