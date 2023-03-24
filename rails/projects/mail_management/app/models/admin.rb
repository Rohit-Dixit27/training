class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,  :omniauthable, omniauth_providers: [ :google_oauth2, :github ]

  def self.from_omniauth(access_token)
    data = access_token.info
    admin = Admin.where(email: data['email']).first
  
    unless admin
      admin = Admin.create(email: data['email'],
        password: Devise.friendly_token[0,20]
      )
    end
    admin
  end        
end
