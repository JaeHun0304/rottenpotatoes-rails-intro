class Movie < ActiveRecord::Base

	@@hash_keys = ["G", "R", "PG-13", "PG"]

	def Movie.getmovie_rating arg1
		@result = Movie.where(rating: arg1)
	end

	def Movie.save_hash_keys arg1
		@@hash_keys = arg1
	end

	def Movie.load_hash_keys
		@@hash_keys
	end

	def Movie.getall_ratings
		movies = Movie.all
		movies_rating = Array.new
		movies.each do |movie|
			movies_rating.push(movie.rating)
		end
		movies_rating.uniq
	end

end
