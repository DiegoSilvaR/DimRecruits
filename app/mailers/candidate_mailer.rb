class CandidateMailer < ApplicationMailer
  def welcome_email(candidate, password, url)
    @candidate = candidate
    @password = password
    @url = url

    mail(to: @candidate.email, subject: '¡Bienvenido a nuestro sitio!')
  end
end
