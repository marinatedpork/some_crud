get '/'  do
	erb :'index'
end

post '/' do
  @user = User.find_by(username: params[:username])
	if @user
	  if @user.authenticate(params[:password])
	  	session[:user_id] = @user.id
	  	@posts = Post.all
	  	erb :"posts"
		end
	end
		@error = "Invalid log in information"
		erb :'index'
end

post '/users' do
	if [params[:password], params[:username]].all? { |field| field.length > 0}
		@user = User.create!(username: params[:username], password: params[:password])
		session[:user_id] = @user.id
		redirect '/posts'
	end
		@message = "Please fill in all the fields"
		erb :'index'
end

get '/posts' do
	@posts = Post.all
	erb :posts	
end

get '/logout' do
	@goobye = "Come back again soon!"
	session.clear[:user_id]
	erb :'index'
end

get '/posts/:post_id/delete' do
	post = Post.find(params[:post_id])
	post.destroy
end

get '/posts/:post_id/edit' do
	@post = Post.find(params[:post_id])
	erb :"_edit", layout: false
end

post '/posts/:post_id/edit' do
	@post = Post.find(params[:post_id])
	@post.title = params[:title]
	@post.body = params[:body]
	@post.save
	erb :"_show_post", layout: false
end