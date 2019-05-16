class HomePagesController < ApplicationController
 def home
 	@search = Tour.available.search params[:q]
    @tours_international = Tour.available.tours_international(2).sample(8)
    @tours_domestic = Tour.available.tours_international(1).sample(8)
    @tours = @search.result(distinct: true)
        .paginate(page: params[:page], per_page: 10)
  end	
end
