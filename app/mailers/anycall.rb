class Anycall < ApplicationMailer
    def welcome_mail
        email = mail from: 'sender@email.com', to: 'receiver@email.com', subject: 'this is an email'
    end
end
