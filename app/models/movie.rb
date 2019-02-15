class Movie < ActiveRecord::Base

	def self.getmovie_rating arg1
		@result = Movie.where(rating: arg1)
	end

	def self.getall_ratings
		@movies = Movie.all
		@all_ratings = Array.new
		@movies.find_each do |movie|
			if @all_ratings.include?(movie.rating) === false
				@all_ratings.push(movie.rating)
			end
		end
	end

end
