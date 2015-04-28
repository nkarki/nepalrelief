class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is? (r)
    self.role == r.to_s
  end

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def reset_authentication_token!
    self.authentication_token = generate_authentication_token_v1
    save
  end

  # devise method overrided to check whether user is active for authentication through approved column
  def active_for_authentication?
    super && approved?
  end
  # devise method overrided for custom message, need to create an entry for :not_approved in devise.en.yml
  def inactive_message
    if !approved?
      :not_approved
    else
      super
    end
  end

  def name
    "#{firstname} #{lastname}"
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

  def generate_authentication_token_v1
    loop do
      token = Devise.friendly_token
      break token unless self.class.unscoped.where(authentication_token: token).first
    end
  end

end
