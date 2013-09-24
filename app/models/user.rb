class User < ActiveRecord::Base
    validates :name, presence: true, length: {maximum: 50}
    validates :password, presence:true, length: {minimum:6}
    validates :password_confirmation, presence:true

    VALIDATE_EMAIL_REGEX = /[\w+\-.]+@[\w+\-.]+\.[a-z]{2,}/i
    validates :email, presence: true, format: {with:VALIDATE_EMAIL_REGEX},
              uniqueness: {case_sensitive:true}

    has_secure_password

    before_save { |user| user.email = user.email.downcase }
end
