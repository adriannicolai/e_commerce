class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
				 :confirmable, :lockable, :trackable

	validates :first_name, :last_name, presence: true
	validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid Email Pattern" }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 8, message: "Password should be at least 8 characters" }
	validates :password, presence: true, confirmation: true, on: :create

	# Validate first name and last name
	validates_with UserRegistrationValidator

	enum user_level: %w[admin user], _suffix: true

	has_many :addresses

	before_save :downcase_email, :titleize_name
	before_update :downcase_email, :titleize_name

	private
	def downcase_email
		self.email.downcase!
	end

	def titleize_name
		self.first_name = self.first_name.titleize
		self.last_name  = self.last_name.titleize
	end
end