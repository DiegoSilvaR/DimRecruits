# app/mailers/account_creation_request_mailer.rb

class AccountCreationRequestMailer < ApplicationMailer
  default from: 'no-reply@example.com'
  layout 'mailer'

  def notify_esteban(request)
    @request = request
    @url = 'https://dimrecruits.onrender.com/candidates/new'
    mail(to: 'estebanrails@gmail.com', subject: 'Nueva Solicitud de Creación de Cuenta')
  end
end
