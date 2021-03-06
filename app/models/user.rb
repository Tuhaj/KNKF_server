class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :meetings
  has_one :meeting
  has_and_belongs_to_many :lectures
  has_many :messages
  belongs_to :reading
  has_many :readings

  before_save :ensure_authentication_token
  before_create :set_vote
  after_create :send_welcome_mail

  def send_welcome_mail
    UserMailer.welcome_mail(self).deliver
    true
  end

  def current_admin
    current_user && current_user.is_admin
  end

  def set_vote
    self.has_a_vote = true
  end
# TODO: remove and check  (checked, important for authentication)
  def ensure_authentication_token
      self.authentication_token ||= generate_authentication_token
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
