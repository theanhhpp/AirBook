class GenresController < ApplicationController
def show
	@genre=Genre.find(params[:id])
	@books=Book.where(genre_id: params[:id])
end
end
