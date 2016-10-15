# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require './encryption'

get '/' do
	@title = "Create message"
	@message = Message.new
	erb :form
end

post '/form' do
	aes = AES.new
	@message = Message.new
	@message.address = (0...15).map { ('a'..'z').to_a[rand(26)] }.join
	@message.message = aes.encrypt(params[:message])
	@message.creation_time = Time.now
	@message.message_type = params[:messageType]
	@message.access_counter = 0
	
	if @message.save
		erb :message_new	
	end
	
end

get '/messages/:message_link' do
	@message = Message.find_by_address(params[:message_link])
	if @message.nil? 
		erb :message_notfound
	else
		aes = AES.new
		if @message.message_type == 0
			if @message.access_counter == 0
				@text = aes.decrypt(@message.message)
				@message.access_counter += 1
				@message.save
				erb :message_view
			else
				erb :message_notfound
			end
			
		elsif @message.message_type == 1
			if (Time.now - @message.creation_time) < 3600.0
				@text = aes.decrypt(@message.message)
				erb :message_view
			else
				erb :message_notfound
			end
		end
	end
end

class Message <  ActiveRecord::Base

end
