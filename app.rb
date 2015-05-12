require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
also_reload('lib/**/*.rb')
require('./lib/question')
require('./lib/survey')
require('pg')
require('pry')


get('/') do
  erb(:index)
end

get('/surveys') do
  @surveys = Survey.all()
  erb(:surveys)
end

post('/surveys') do
  title = params.fetch('title')
  @new_survey = Survey.new({:title => title})

  if @new_survey.save()
    erb(:success)
  else
    erb(:error)
  end
end

get('/surveys/:id/edit') do
  @survey = Survey.find(params.fetch('id').to_i)
  erb(:edit_survey)
end

patch('/surveys/:id') do
  title = params.fetch('title')
  @survey = Survey.find(params.fetch('id').to_i)
  @survey.update({:title => title})
  @surveys = Survey.all()
  erb(:surveys)
end

delete('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  @survey.delete()
  @surveys = Survey.all()
  erb(:surveys)
end

get('/surveys/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  erb(:survey)
end

post('/surveys/:id') do
  @survey = Survey.find(params.fetch("id").to_i)
  description = params.fetch("description")
  choice_1 = params.fetch("first_answer")
  choice_2 = params.fetch("second_answer")
  choice_3 = params.fetch("third_answer")
  choice_4 = params.fetch("fourth_answer")
  @question = @survey.questions().new({:description => description, :choice_1 => choice_1, :choice_2 => choice_2, :choice_3 => choice_3, :choice_4 => choice_4})

  if @question.save()
    erb(:survey)
  else
    erb(:error)
  end
end

get('/surveys/:survey_id/questions/:id') do #change routing
  @survey = Survey.find(params.fetch("survey_id"))
  @question = Question.find(params.fetch("id"))
  erb(:edit_question)

end

patch('/surveys/:survey_id/questions/:id') do
  @survey = Survey.find(params.fetch('survey_id'))
  @question = Question.find(params.fetch('id'))
  description = params.fetch("description", @question.description())
  choice_1 = params.fetch("first_answer")
  choice_2 = params.fetch("second_answer")
  choice_3 = params.fetch("third_answer")
  choice_4 = params.fetch("fourth_answer")
  @question.update({:description => description, :choice_1 => choice_1, :choice_2 => choice_2, :choice_3 => choice_3, :choice_4 => choice_4})
  redirect("/surveys/#{@survey.id}")
end

delete('/surveys/:survey_id/questions/:id') do
  @question = Question.find(params.fetch('id'))
  @question.delete()
  redirect("/surveys/#{@question.survey_id}")
end

get('/take_surveys') do
  @surveys = Survey.all()
  erb(:take_surveys)
end

get('/take_surveys/:id') do
  @survey = Survey.find(params.fetch('id'))
  erb(:take_survey)
end

get('/take_surveys/:id/results') do
  @survey = Survey.find(params.fetch('id'))
  @first_answer = params.fetch('choice0')
  @second_answer = params.fetch('choice1')
  answer = []
  iterate = 0
  @survey.questions().each do |question|
    answer.push(params.fetch("choice#{iterate}"))
    iterate += 1
  end
  erb(:index)
end
