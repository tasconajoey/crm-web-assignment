# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require 'sinatra'
require_relative 'contact'

Contact.create('Betty', 'Maker', 'betty@bitmakerlabs.com', 'Developer')

get '/' do
  @num_of_contacts = Contact.all.length
  erb :contacts
end

get '/contacts' do
  @num_of_contacts = Contact.all.length
  erb :contacts
end

get '/about' do
  erb :about
end

get '/contacts/new' do
  erb :new_contacts
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end
