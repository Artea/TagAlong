class Event < ActiveRecord::Base

	belongs_to :user
	belongs_to :attendee

	def eventname
		"#{event.name}"
	end
end
