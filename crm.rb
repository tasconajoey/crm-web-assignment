# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require 'sinatra'
require_relative 'contact'

Contact.create('Betty', 'Maker', 'betty@bitmakerlabs.com', 'Developer')

get '/' do
  @num_of_contacts = Contact.all.length
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/about' do
  erb :about
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/')
end

get '/contacts/1' do
  @contact = Contact.find(1)
  erb :show_contact
end
