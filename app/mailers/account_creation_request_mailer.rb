class AccountCreationRequestMailer < ApplicationMailer
  default from: 'no-reply@example.com'
  layout 'mailer'

  def notify_esteban(request)
    @request = request
    @url = 'https://dimrecruits.onrender.com/account_creation_requests/new' # Actualiza la URL aquí
    mail(to: 'estebanrails@gmail.com', subject: 'Nueva Solicitud de Creación de Cuenta')
  end
end
