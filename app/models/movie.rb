class Movie < ActiveRecord::Base

	def self.getmovie_rating arg1
		@result = Movie.where(rating: arg1)
	end

	def self.getall_ratings arg1
		@movies = Movie.all
		@movies.find_each do |movie|
			if arg1.include?(movie.rating) === false
				arg1.push(movie.rating)
			end
		end
	end

end
