# ------ CREATE ------ #

get '/surveys/new' do
  if not current_user
    redirect '/sessions/new'
  else
    @survey = Survey.new
    erb :"surveys/new"
  end
end


get 'surveys/:id/info' do
  @survey = Survey.find(params[:id])
  if @survey.creator.id == current_user
    erb :"surveys/info"
  else
    redirect '/surveys'
  end
end

get '/surveys/:id' do |id|
  @survey = Survey.find(id)
  erb :"surveys/show"
end

post '/surveys/:id' do |id|
  survey = Survey.find(id)
  params[:questions].each do |question_id, choice_id|
    Answer.create(question_id: question_id, choice_id: choice_id)
  end
  redirect '/surveys'
end

post '/surveys' do
  @survey = Survey.new
  @survey.name = params[:name]
  params[:questions].each do |question_data|
    question = Question.create(text: question_data["text"], survey: @survey)
    choices = question_data["choices"]
    choices.each do |choice_text|
      Choice.create(text: choice_text, question: question)
    end
  end

  if @survey.save
    redirect "/surveys/#{@survey.id}"
  else
    erb :"surveys/new"
  end
end


# ------ UPDATE ------ #

get '/surveys/:id/edit' do |id|
  @survey = Survey.find(id)
  erb :"surveys/edit"
>>>>>>> 68d8859a530b99d636e593dc69a85248839c5369
end

put '/surveys/:id' do |id|
  @survey = Survey.find(id)
  @survey.name = params[:name]
  params[:questions].each do |question_data|
    question = Question.create(text: question_data["text"], survey: @survey)
    choices = question_data["choices"]
    choices.each do |choice_text|
      Choice.create(text: choice_text, question: question)
    end
  end

  if @survey.save
    redirect "/surveys/#{@survey.id}"
  else
    erb :"surveys/edit"
  end
end

<<<<<<< HEAD
get '/questions/new' do
=======

# ------ DELETE ------ #

delete '/surveys/:id' do |id|
  survey = Survey.find(id)
  survey.destroy
  redirect "/surveys"
end


# ------- READ ------- #

get '/surveys' do
  @surveys = Survey.all
  erb :"surveys/index"
end

get '/surveys/:id' do |id|
  @survey = Survey.find(id)
  erb :"surveys/show"
end


# ------- TAKE ------- #

post '/surveys/:id' do |id|
  survey = Survey.find(id)

  params[:questions].each do |question_id, choice_id|
    Answer.create(question_id: question_id, choice_id: choice_id)
  end

  redirect '/surveys'
end


# ------ AJAX ------ #

get '/questions/new' do
>>>>>>> 68d8859a530b99d636e593dc69a85248839c5369
  if request.xhr?
    erb :"surveys/_question", layout: false, locals: {question: Question.new}
  end
end

get '/choices/new' do
  if request.xhr?
    erb :"surveys/_choice", layout: false, locals: {choice: Choice.new}
  end
end

