class HomePagesController < ApplicationController
 def home
    @tours_international = Tour.tours_international(2).limit 8
    @tours_domestic = Tour.tours_international(1).limit 8
  end	
end
