require ( 'sinatra')
require ( 'sinatra/contrib/all')
require_relative ('./models/Student')

get '/students' do
  @students = Student.find_all()
  erb(:students)
end

