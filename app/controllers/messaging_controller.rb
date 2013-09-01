require 'server_side/sse'

class MessagingController < ApplicationController
	include ActionController::Live

	def index
	end

	def send_message
		response.headers['Content-Type'] = 'text/event-stream'
		sse = ServerSide::SSE.new(response.stream)
		begin
			loop do
				sse.write({ :message => "#{params[:message]}" })
				sleep 1
			end
		rescue IOError
		ensure
			sse.close
		end
	end
end
