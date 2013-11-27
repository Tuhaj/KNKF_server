class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :meetings
  has_and_belongs_to_many :lectures
  has_many :applications
  has_many :surveys


  after_create :send_welcome_mail

  def send_welcome_mail
		UserMailer.welcome_mail(self).deliver
	end

  def current_admin
    current_user && current_user.is_admin
  end

  

end
