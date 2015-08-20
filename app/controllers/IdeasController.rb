class IdeasController < App
	get '/' do
		redirect 'ideas/sort-by/created'
	end

	get '/sort-by' do
		redirect 'ideas/sort-by/created'
	end

	get '/sort-by/created' do
		@heading = "Idea List ~ Sorted by Creation Time"
		@ideas = Idea.order(created_at: :desc)
		### call the ideas list display view
		erb :idea_list
	end

	get '/sort-by/title' do
		@heading = "Idea List ~ Sorted by Idea Title"
		@ideas = Idea.order(title: :asc)
		### call the ideas list display view
		erb :idea_list
	end

	get '/sort-by/ranking' do
		#{}"display the ideas in the sort-by-ranked"
		@heading = "Idea List ~ Sorted by Ranking"
		@ideas = Idea.order(likes: :desc)
		### call the ideas list display view
		erb :idea_list
	end

	get '/created-by/:username' do |username|
		@member	= Member.where(username: username).take
		@heading = "Idea List ~ Created by #{username.capitalize}"
		@ideas	= Idea.where(created_by: username).all
		# call the view to display all the ideas by this user
		erb :idea_list
	end

	get '/:id/view' do |idea_id|
		#{}"Display the idea with the id of '#{idea_id}'"
		@idea = Idea.find(idea_id.to_i)
		## call the idea display view
		erb :idea_view
	end

	post '/:id/like' do |idea_id|
		#{}"Increment the like field of idea with the id '#{idea_id}'"
		if !session[:username]
			flash[:global] = {alert_type: 'alert-warning', message: "<strong>Sorry!</strong>
				You need to login to perform this action."}

			redirect back 
		end
		
		idea = Idea.find(idea_id.to_i)
		#byebug
		idea[:likes] += 1
		idea.save

		#Add to the 'Like' table
		Like.create(
			:liked_by	=> session[:username],
			:idea_id	=> idea_id.to_i
			)

		redirect back
	end

	post '/:id/unlike' do |idea_id|
		#{}"Increment the like field of idea with the id '#{idea_id}'"
		redirect back if !session[:username]

		idea = Idea.find(idea_id.to_i)
		idea[:likes] -= 1
		idea.save

		#Add to the 'Like' table
		Like.where("idea_id = '#{idea.id.to_i}' AND liked_by = '#{session[:username]}'").destroy_all

		redirect back
	end

	post '/:id/delete' do |idea_id|
		#{}"Delete the select idea by ':username' with id ':idea_id'"
		Idea.destroy(idea_id.to_i)
		Like.where({idea_id: idea_id.to_i}).destroy_all

		flash[:global] = {alert_type: 'alert-warning', message: "<strong>Shhhhh!</strong>
			That your idea has been deleted."}

		redirect "/ideas/created-by/#{ session[:username] }"
	end
end