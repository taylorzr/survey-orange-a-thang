enable :sessions
set :protection, except: :session_hijacking

get '/' do
  erb :index
end
