class Movie < ActiveRecord::Base

	def Movie.getmovie_rating arg1
		@result = Movie.where(rating: arg1)
	end

	def Movie.getall_ratings arg1
		@selected_movies = Movie.all.rating.uniq
		@selected_movies.each do |movie|
			arg1 = movie.rating
		end

		return arg1
	end

end
