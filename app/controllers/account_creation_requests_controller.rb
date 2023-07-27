class AccountCreationRequestsController < ApplicationController
  def new
    @request = AccountCreationRequest.new
  end

  def show
    @request = AccountCreationRequest.find(params[:id])
  end

  def create
    @request = AccountCreationRequest.new(request_params)
    @request.token = SecureRandom.urlsafe_base64(20) # Generamos un token único para la solicitud
    @request.approved = false # Establecemos el valor de 'approved' como falso al crear la solicitud

    if @request.save
      # Enviamos un correo electrónico a Esteban con los detalles de la solicitud
      AccountCreationRequestMailer.with(request: @request).notify_esteban.deliver_now

      redirect_to root_path, notice: "Tu solicitud ha sido enviada. Esteban revisará tus datos y tomará una decisión."
    else
      render :new
    end
  end

  def pending_requests
    @pending_requests = AccountCreationRequest.where(approved: false)
  end

  def approved
    @request = AccountCreationRequest.find_by(token: params[:token])

    if @request && !@request.approved?
      # Generamos un token único para la solicitud al momento de aprobarla
      @request.token = SecureRandom.urlsafe_base64(20)

      # Marcamos la solicitud como aprobada
      @request.update(approved: true)

      # Generamos una contraseña aleatoria de 8 caracteres
      password = Devise.friendly_token.first(8)

      # Buscamos el candidato por su correo electrónico
      @candidate = Candidate.find_by(email: @request.email)

      if @candidate
        # El candidato ya existe, actualizamos su contraseña
        @candidate.update(password: password)
      else
        # El candidato no existe, lo creamos con la contraseña generada
        @candidate = Candidate.new(
          name: @request.name,
          email: @request.email,
          password: password,
          experience: @request.experience,
          skills: @request.skills,
          salary_expectation: @request.salary_expectation,
          professional_title: @request.professional_title
        )
        @candidate.save
      end

      # Enviamos el correo de bienvenida al candidato con sus datos de acceso
      login_url = 'https://dimrecruits.onrender.com/candidates/sign_in'
      CandidateMailer.welcome_email(@candidate, password, login_url).deliver_now

      redirect_to root_path, notice: "La solicitud ha sido aprobada. El correo de bienvenida ha sido enviado al candidato."
    else
      redirect_to root_path, alert: "Esta solicitud no existe o ya ha sido aprobada anteriormente."
    end
  end

  private

  def request_params
    params.require(:account_creation_request).permit(:name, :email, :experience, :skills, :salary_expectation, :professional_title, :message)
  end
end
