class AccountCreationRequestMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  default from: 'no-reply@example.com'
  layout 'mailer'

  def notify_esteban
    @request = params[:request]
    @url = new_candidate_url # Genera el URL para la acción 'new' en el controlador 'candidates'
    mail(to: 'estebanrails@gmail.com', subject: 'Nueva Solicitud de Creación de Cuenta')
  end
end
