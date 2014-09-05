get '/surveys' do
  @surveys = Survey.all
  erb :"surveys/index"
end

get '/surveys/new' do
  if not current_user
    redirect '/login'
  else
    erb :"surveys/new"
  end
end

post '/surveys' do
  survey_data = params[:survey].merge({user: current_user})
  @survey = Survey.new(survey_data)
  if @survey.save
    redirect "/"
  else
    erb: :"surveys/new"
  end
end

get '/surveys/:id' do |id|
  @survey = Survey.find(id)
  erb :"surveys/show"
end
