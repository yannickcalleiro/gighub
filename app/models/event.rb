class Event < ActiveRecord::Base
	belongs_to :host
	has_and_belongs_to_many :artists

   def self.new_event_filter
   	start = DateTime.now
   	events = self.where("date > ?", start)
   end
end
