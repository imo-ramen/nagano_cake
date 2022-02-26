class SearchesController < ApplicationController
  before_action :authenticate_customer!

def search
		@content = params[:content]
	    @items=Item.where(is_active: true).search_for(@content)
end

end
