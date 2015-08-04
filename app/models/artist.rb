class Artist < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_and_belongs_to_many :events
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def video_info
  	if youtube_address.present?
	    return VideoInfo.new(youtube_address)
  	else
  	  return nil
	  end
  end
  
  # def self.search(role, price, hour)
  #   role = params[:request]
  #     artists = Artist.where("role LIKE ?", role.downcase)
  #   artist = Artist.where(['role = ?', role])
  # end

end
