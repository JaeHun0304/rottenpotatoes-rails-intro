class Movie < ActiveRecord::Base

	def Movie.getmovie_rating arg1
		@result = Movie.where(rating: arg1)
	end

	def Movie.getall_ratings
		@movies = Movie.all
		@ratings = Array.new
		@movies.each do |movie|
			if @ratings.include?(movie.rating) === false
				@ratings.push(movie.rating)
			end
		end
	end

end
