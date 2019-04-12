class HomePagesController < ApplicationController
 def home
    @tours_international = Tour.tours_international(2).sample(8)
    @tours_domestic = Tour.tours_international(1).sample(8)
  end	
end
