class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  
  ROLES = %w[admin guide basic]
  
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :basic
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.user_image = auth.info.image
    end
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:email => data["email"]).first

  #     Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(name: data["name"],
             email: data["email"],
             password: Devise.friendly_token[0,20],
             user_image: data["image"]
          )
      end
      user
  end
  

  
end
