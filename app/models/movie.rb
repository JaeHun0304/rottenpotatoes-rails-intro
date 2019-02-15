class Movie < ActiveRecord::Base

	def Movie.getmovie_rating arg1
		@result = Movie.where(rating: arg1)
	end

	def Movie.getall_ratings arg1
		@movies = Movie.all
		@movies.each do |movie|
			if arg1.include?(movie.rating) === false
				arg1.push(movie.rating)
			end
		end
	end

end
