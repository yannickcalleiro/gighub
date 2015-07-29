class Event < ActiveRecord::Base
	belongs_to :hosts
	belongs_to :artists
end
