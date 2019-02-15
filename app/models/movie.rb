class Movie < ActiveRecord::Base

	def Movie.getmovie_rating arg1
		@result = Movie.where(rating: arg1)
	end

	def Movie.getall_ratings arg1
		movies = Movie.all
		movies.each do |movie|
			movies_rating.push(movie.rating)
		end
		movies_rating.uniq
	end

end
