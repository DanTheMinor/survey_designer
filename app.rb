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
  answer = params.fetch("answer")
  @question = @survey.questions().new({:description => description, :answer => answer})
  if @question.save()
    erb(:survey)
  else
    erb(:error)
  end
end
