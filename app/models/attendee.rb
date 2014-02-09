class Attendee < ActiveRecord::Base

	has_one :event
	has_and_belongs_to_many :users, -> { uniq }
	validates :event, presence: true

end
