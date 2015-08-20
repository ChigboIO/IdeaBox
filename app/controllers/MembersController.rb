class MembersController < App
	before do
		#Helpers.is_authenticated?
		if !session[:username]
			flash[:global] = {alert_type: 'alert-danger', message: "<strong>Sorry!</strong>
				Authentication is required to access the requested page."}

			redirect '/auth' 
		end
	end
	get '/' do
		#{}"redirects to the 'members/:username/dashboard"
		redirect "members/#{ session[:username] }/dashboard"
	end

	get '/:username/dashboard' do |username|
		#"Displays members dashboard"
		@member = Member.where(username: username).take
		#call the dashboard view to render the profile
		erb :dashboard
	end


##make only this view to be accessible by anybody without authenticationa
	get '/:username/idea/create' do |username|
		#{}"Create a form to create new idea by ':username'"
		@member = Member.where(username: username).take
		@idea	= {id: 0, title: '', description: ''}
		#call the form view
		erb :create
	end

	post '/:username/idea/create' do |username|
		#{}"Process the submitted idea creation form"
		@member	= Member.where(username: username).take
		if params[:id].to_i == 0
			idea 	= Idea.create({
				:title			=> params[:title], 
				:description	=> params[:description],
				:created_by		=> @member[:username]
				})
		else
			idea = Idea.update(params[:id], {
				:title			=> params[:title], 
				:description	=> params[:description],
				:created_by		=> @member[:username]
				})
		end
		if idea.errors.any? 

			flash[:global] = {alert_type: 'alert-danger', message: "<strong>Error!</strong>
				Please ensure you fill the required fields."}

			redirect "/members/#{session[:username]}/idea/create"
		end

		flash[:global] = {alert_type: 'alert-success', message: "<strong>Congratulations!</strong>
			Your idea has been created and is displayed below."}

		redirect "ideas/#{ idea[:id] }/view"
	end

	get '/:username/idea/:id/edit' do |username, idea_id|
		#{}"Display form for editting the selected idea"
		@member	= Member.where(username: username).take
		@idea	= Idea.find(idea_id.to_i)
		# class the editing form view
		erb :create
	end
=begin
	put '/:username/ideas/:id/edit' do |username, idea_id|
		#{}"Process and modify the selected idea"
		#member = Member.where(username: username).take
		idea			= Idea.find(idea_id.to_i)
		idea.title		= params[:title]
		idea.description= params[:description]
		idea.save
		redirect "ideas/#{ idea[:id] }/view"
	end
=end

end