class CandidateMailer < ApplicationMailer
  def welcome_email(candidate, password)
    @candidate = candidate
    @password = password
    @login_url = "https://dimrecruits.onrender.com/candidates/sign_in"

    mail(to: @candidate.email, subject: '¡Bienvenido a nuestro sitio!')
  end
end
