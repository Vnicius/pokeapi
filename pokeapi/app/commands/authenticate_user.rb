class AuthenticateUser
    prepend SimpleCommand

    def initialize(email, password)
        @email = email
        @password = password
    end

    def call
        :: JsonWebToken.encode({id: user.id}) if user
    end

    private

    attr_accessor :email, :password

    def user
        user = User.find_by_email(email)

        unless user
            errors.add(:user_authentication, 'invalid email')
            return nil
        end

        return user if user.authenticate(password)
        errors.add(:user_authentication, 'invalid password')
        nil
    end
end