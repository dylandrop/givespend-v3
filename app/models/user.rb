class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def stripe_parameters
    {
      'stripe_user[business_type]' => 'sole_prop',
      'stripe_user[currency]' => 'usd'
    }
  end

  def apply_omniauth(omniauth)
    self.secret_key = omniauth['credentials']['token']
    self.public_key = omniauth['info']['stripe_publishable_key']
    self.uid = omniauth['uid']
  end
end
