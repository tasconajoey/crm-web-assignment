# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require 'sinatra'
require_relative 'contact'

get '/' do
  @crm_app_name = "Joey's CRM"
  erb :index
end

get '/contacts' do
  erb :contacts, layout: false
end

get '/contacts/new' do
  erb :new_contacts, layout: false
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end
