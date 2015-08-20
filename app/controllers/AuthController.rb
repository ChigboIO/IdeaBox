class AuthController < App
	before do
		#Helpers.is_authenticated?
		redirect "/members/#{ session[:username] }/dashboard" if session[:username]
	end
	
	get "/" do
		#{}"You are in authentication home page"
		erb :auth
	end
	get '/signup' do
		#{}"Sign up form here"
		redirect '/auth'
	end

	post '/signup' do
		#{}"Submited the signup form"
		avatar = ['avatar (1).png','avatar (2).png','avatar (3).png','avatar (4).png','avatar (5).png','avatar (6).png',
		'avatar (7).png','avatar (8).png','avatar (9).png','avatar (10).png','avatar (11).png','avatar (12).png',
		'avatar (13).png','avatar (14).png','avatar (15).png','avatar (16).png','avatar (17).png','avatar (18).png',
		'avatar (19).png','avatar (20).png']
		member = Member.create(
			:fullname	=> params[:fullname],
			:email		=> params[:email],
			:username	=> params[:username],
			:password	=> params[:password].crypt("abcde12345"),
			:avatar		=> avatar.sample
			)

		if member.errors.any?
			flash[:errors] = member.errors
			flash[:global] = {alert_type: 'alert-danger', message: member.errors[:username]}

			#byebug
			redirect back
		end
		session[:username] = params[:username]

		flash[:global] = {alert_type: 'alert-success', message: "<strong>Congratulations!</strong>
			Your account has been created and you are now logged in."}

		redirect "members/#{ session['username'] }/dashboard"
	end

	get "/login" do
		#{}"Login page"
		redirect '/auth'
	end
	
	post '/login' do
		#{}"Sumbited login form"
		member = Member.where(:username => params[:username]).take
		if !member.nil? && member.password == params[:password].crypt('abcde12345')
			session[:username] = member.username

			flash[:global] = {alert_type: 'alert-success', message: "<strong>Welcome back!</strong>
				#{session[:username]}"}

			redirect "members/#{ session[:username] }/dashboard"
		else

			flash[:global] = {alert_type: 'alert-danger', message: "<strong>Oh Shit!</strong>
				That was a wrong combination of username and password."}

			redirect '/auth'
		end
	end

end