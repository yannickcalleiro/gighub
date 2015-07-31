class Event < ActiveRecord::Base
	belongs_to :hosts
	belongs_to :artists

   def self.new_event_filter
   	start = DateTime.now
   	events = self.where("date > ?", start)
   end
end
