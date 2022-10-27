class User < ApplicationRecord
    STRING_ONLY_REGEX = /[@%^&!"\\\*\.,\-\:?\/\'=`{}()+_\]\|\[\><~;$#0-9]/

    validates :first_name, presence: true, format: { with: STRING_ONLY_REGEX, message: "Special characters are not allowed", multiline: true }
    validates :last_name, presence: true, format: { with: STRING_ONLY_REGEX, message: "Special characters are not allowed", multiline: true }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid Email Pattern" }, uniqueness: { case_sensitive: false }
end
