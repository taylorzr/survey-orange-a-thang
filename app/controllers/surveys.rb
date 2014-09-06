get '/surveys' do
  @surveys = Survey.all
  erb :"surveys/index"
end

get '/surveys/new' do
  if not current_user
    redirect '/sessions/new'
  else
    erb :"surveys/new"
  end
end

get '/surveys/:id' do |id|
  @survey = Survey.find(id)
  erb :"surveys/show"
end

post '/surveys' do
  @survey = Survey.new(name: params[:name])
  params[:questions].each do |question_data|
    question = Question.create(text: question_data["text"], survey: @survey)
    choices = question_data["choices"]
    choices.each do |choice_text|
      Choice.create(text: choice_text, question: question)
    end
  end

  if @survey.save
    redirect "/"
  else
    erb :"surveys/new"
  end
end

get '/questions/new' do 
  if request.xhr?
    erb :"surveys/_question", layout: false
  end
end

get '/choices/new' do
  if request.xhr?
    erb :"surveys/_choice", layout: false
  end
end

