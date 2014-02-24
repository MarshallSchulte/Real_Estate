class Gallery < ActiveRecord::Base

  belongs_to :listing

  has_many :pictures, :dependent => :destroy

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless Gallery.where(token: random_token).exists?
    end
  end

end