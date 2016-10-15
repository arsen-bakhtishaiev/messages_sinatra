require 'rspec'
require 'rack/test'
require_relative "../main"
require 'spec_helper'

require 'sinatra/activerecord'
require_relative '../environments'

include Rack::Test::Methods

def app
	Sinatra::Application
end

describe 'Message application', :type => :controller do
	
	it 'should allow accessing the home page' do
		get '/'
		expect(last_response).to be_ok
	end

	it 'should allow to save message' do
		post '/form', :message => 'test_message', :message_type => 0
		expect(last_response.body).to include 'Here\'s the link to your message' 
	end

	it 'should give access to stored message' do
		message = Message.new
		message.address = 'test_adress'
		message.message = 'test_message'
		message.creation_time = Time.now
		message.message_type = 0
		message.access_counter = 0
		message.save
		get '/messages/test_adress'
		expect(last_response.body).to include 'test_message' 
	end 

end


