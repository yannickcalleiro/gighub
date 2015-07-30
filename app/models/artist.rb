class Artist < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :events
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def video_info
  	if youtube_address.present?
	  return VideoInfo.new(youtube_address)
  	else
  	  return nil
	end
  end
end
