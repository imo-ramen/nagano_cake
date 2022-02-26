class SearchesController < ApplicationController
	# headerのサーチフォーム
	def search
		@content=params[:content]
		@items=Item.where(is_active:true).search_for(@content)
	end

	def genresearch
		@content=params[:content]
		@genre=Genre.find_by(name: @content)
		@items=Item.where(is_active: true, genre_id: @genre.id)
	end
end
