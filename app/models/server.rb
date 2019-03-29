class Server < ApplicationRecord 
  validates :name, :creator_id, presence: true
  validates :invite_code, presence: true
  

  belongs_to :creator,
    class_name: "User"

  has_many :memberships,
    as: :location

  has_many :users,
    through: :memberships,
    source: :user

  after_initialize :ensure_invite_url, :ensure_invite_expires


  def ensure_invite_url
    @invite_code ||= Server.generate_invite_url
  end


  def self.generate_invite_url
    code = SecureRandom.hex.slice(0..7)
    "/invite/" + code
  end
  
  def reset_invite_url!
    self.invite_code = Server.generate_invite_url
    self.invite_code
  end

  def ensure_invite_expires
    if !@invite_expires || self.invite_expires > Time.now
      self.reset_invite_url!
      self.invite_expires = Time.now + 86400
      self.invite_expires
    else
      self.invite_expires
    end
  end


end