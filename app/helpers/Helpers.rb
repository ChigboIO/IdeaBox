class Helpers
	def self.is_authenticated?
		if session[:username]
			true
		else
			erb :assess_denied
		end
	end
end