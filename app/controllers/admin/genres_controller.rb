class Admin::GenresController < ApplicationController
    def index
        @genre = Genre.new
        @genres = Genre.all
    end
    
    def create
        @genre = Genre.new(genre_params)
        @genre.save
        redirect_to request.referer
    end
    
    
    def edit
        @genre = Genre.find(params[:id])
    end
    
    def update
        genre = Genre.find(params[:id])
        genret.update(genret_params)
        redirect_to genre_path(genre.id)
    end
    
    private
     # ストロングパラメータ
    def genre_params
        params.require(:genre).permit(:name)
    end
    
end
