# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


get '/' do
	erb :form
end

get '/messages/:message_link' do
	#TODO: input code for getting message 
end

class Message <  ActiveRecord::Base

end
