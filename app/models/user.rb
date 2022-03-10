class User < ApplicationRecord
  validates :email, uniqueness: true

  def self.create_from_omniauth(auth)
    create(provider: auth['provider'],
           uid: auth['uid'],
           email: auth['info']['email'])
  end

  def support_user?
    user_type == 'support_user'
  end
end
