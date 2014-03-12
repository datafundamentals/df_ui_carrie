$LOAD_PATH << '.'
require 'opsetup'
require 'datasource'
require 'generate'
require 'gen_util'
require 'rubygems'
require 'sinatra'

configure do
  enable :sessions
end

helpers do
  def username
    session[:identity] ? session[:identity] : 'Please log in and set preferences before using this app'
  end
end

before '/home' do
 if !session[:identity] || !session[:workspaceFolder] then
   session[:previous_url] = request.path
   @error = 'Please set up first ' + request.path
   halt erb(:login_form)
 end
end

before '/datasource/add' do
  if !session[:identity] || !session[:workspaceFolder] then
    redirect to '/login/form'
  end
end

before '/opsetup/add' do
  if !session[:identity] || !session[:workspaceFolder] then
    redirect to '/login/form'
  end
end

get '/' do
  erb :home
end

get '/datasource/add' do
  session[:myDataSource] = DataSource.new
  params.clear
  erb :add_datasource_form
end

get '/opsetup/add' do
  session[:myOpsSetup] = OpSetup.new
  params.clear
  erb :add_ops_setup
end


post '/datasource/complete' do
  session[:myDataSource].authorName = session[:identity]
  if !session[:myDataSource] then
    session[:myDataSource] = DataSource.new
  else
    consumeDatasourceParams(params, session[:myDataSource])
  end
  if  !isCompleteInitialDatasourcePage(session[:myDataSource]) then
    erb :add_datasource_form
  elsif !isCompleteForHadoop(session[:myDataSource]) then
    erb :detail_hadoop
  elsif !isCompleteForSchemaDataOption1(session[:myDataSource]) then
    erb :schema_data_option_1
  elsif !isCompleteForSchemaDataOption2(session[:myDataSource]) then
    erb :schema_data_option_2
  elsif !isCompleteForSchemaDataOption3(session[:myDataSource]) then
    erb :schema_data_option_3
  elsif !isCompleteForSchemaDataOption4(session[:myDataSource]) then
    erb :schema_data_option_4
  elsif !isCompleteForSchemaDataOption5(session[:myDataSource]) then
    erb :schema_data_option_5
  elsif !isCompleteForSchemaDataOption6(session[:myDataSource]) then
    erb :schema_data_option_6
  else
    my_generate = Generate.new session[:myDataSource]
    my_generate.dosomething 
    erb :detail_something, :locals => {:datasource => session[:myDataSource]}
  end
end

get '/login/form' do
  erb :login_form
end

post '/login/attempt' do
  session[:identity] = params['authorName']
  session[:workspaceFolder] = params['workspaceFolder']
  where_user_came_from = session[:previous_url] || '/'
  redirect to where_user_came_from
end

get '/logout' do
  session.delete(:identity)
  session.delete(:workspaceFolder)
  erb "<div class='alert alert-message'>Logged out</div>"
end
