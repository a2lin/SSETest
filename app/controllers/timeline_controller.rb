class TimelineController < ApplicationController
	def index
		@users = User.all
		@tickets = Ticket.all
		@attachments = Attachment.all

		render stream: true
	end
end
