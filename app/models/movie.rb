class Movie < ActiveRecord::Base

	def getmovie_rating arg1
		@result = Movie.where(rating: arg1)
	end

	def getall_ratings arg1
		Movie.each do |movie|
			if arg1.include?(movie.rating) === false
				arg1.push(movie.rating)
			end
		end
	end

end
