module UserInterestsHelper

	def checked(area)
		@interests.name.nil? ? false :@interest.name.match(area) 
	end 
	
end
