class PostsController < ApplicationController

  #index
  get "/posts" do
    erb :"/posts/index.html"
  end

  #new
  get "/posts/new" do
    erb :"/posts/new.html"
  end

  # create
  post "/posts" do
    redirect "/posts"
  end

  # show
  get "/posts/:id" do
    erb :"/posts/show.html"
  end

end
