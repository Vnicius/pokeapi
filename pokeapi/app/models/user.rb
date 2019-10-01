class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /.+@.+\..+/ }
    validates :password, presence: true, length: { in: 8..15 }
end
