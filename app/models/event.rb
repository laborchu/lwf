class Event < ActiveRecord::Base
	validates_presence_of :name
  has_one :location
  has_many :attendees
  has_many :event_groupships
  has_many :groups, :through => :event_groupships
end
