class HomeController < App

    get "/" do
        erb :index
    end

    get '/access_denied' do
		erb :access_denied
	end

	get "/logout" do
		#{}"Addded logout on"
		session.clear
		redirect '/'
	end

	get '/about-us' do
		"About us page"
	end

	get '/contact' do
		"contact us page"
	end

	post '/contact' do
		"submited the contact us form"
	end

	get '/sponsors' do
		"View the sponsoring companies"
	end
end