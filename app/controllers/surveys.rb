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

get '/surveys/:id' do |id|
  @survey = Survey.find(id)
  erb :"surveys/show"
end

post '/surveys/:id' do |id|
  survey = Survey.find(id)
  # raise params.inspect

  params[:questions].each do |question_id, choice_id|
    Answer.create(question_id: question_id, choice_id: choice_id)
  end

  # survey.questions.each do |question|
  #   answer = Answer.create(question_id: question.id, choice_id: params[choice.id])
  # end
  redirect '/surveys'
end

post '/surveys' do
  survey_data = params[:survey].merge({user: current_user})
  @survey = Survey.new(survey_data)
  if @survey.save
    redirect "/"
  else
    erb :"surveys/new"
  end
end

