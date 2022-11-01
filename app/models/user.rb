class User < ApplicationRecord
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid Email Pattern" }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 8, message: "Password should be at least 8 characters" }
    validates :password, presence: true, confirmation: true, on: :create

    # Validate first name and last name
    validates_with UserRegistrationValidator

    enum user_level: %w[admin user]
end
