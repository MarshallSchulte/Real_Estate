class Listing < ActiveRecord::Base
  #attr_accessible :address, :price, :beds, :bathrooms, :sqft, :addinfo, :image
  has_one :gallery, :dependent => :destroy
  #validates :user_id, presence: true
  default_scope -> { order('created_at DESC') }
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless Listing.where(token: random_token).exists?
    end
  end
end
