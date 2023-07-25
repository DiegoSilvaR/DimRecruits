class AccountCreationRequestMailer < ApplicationMailer
  default from: 'no-reply@example.com'
  layout 'mailer'

  def notify_esteban
    @request = params[:request]
    @url = "#{root_url}candidates/new" # Cambia esta por ejemplo en render
    mail(to: 'estebanrails@gmail.com', subject: 'Nueva Solicitud de Creación de Cuenta')
  end
end
