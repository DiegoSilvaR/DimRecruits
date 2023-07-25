class AdminController < ApplicationController
  before_action :authenticate_admin!

  def new_candidate
    @candidate = Candidate.new
  end

  def create_candidate
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to root_path, notice: "Cuenta de candidato creada exitosamente."
    else
      render :new_candidate
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :email, :password, :password_confirmation, :experience, :skills, :salary_expectation, :professional_title, :role)
  end
end
