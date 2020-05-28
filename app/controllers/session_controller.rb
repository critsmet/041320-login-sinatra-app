class SessionController < ApplicationController

  get '/signup' do
    erb :'sessions/signup'
  end

  get '/login' do
    erb :'sessions/login'
  end

  post '/signup' do
    # this is the way you should do it if you're using nested params User.create(params[:user])
    user = User.new
    user.username = params[:username]
    user.password = params[:password]
    user.save
    session[:user_id] = user.id
    redirect to '/'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/'
    else
      @error = "Invalid Credentials"
      erb :'sessions/login'
    end
  end

  get '/logout' do
    session[:user_id] = nil
    redirect to "/"
  end

end
