enable :sessions

get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :sign_up
end

post '/users' do
  # sign-up
  @user = User.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    erb :sign_up
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  if @user.id == session[:user_id]
    erb :'/users/show'
  else
    erb :sign_in
  end
end
