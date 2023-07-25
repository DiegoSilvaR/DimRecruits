# app/controllers/candidates_controller.rb
class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[show edit update destroy profile update_profile]
  before_action :authenticate_candidate!, except: [:destroy_by_admin]
  before_action :authenticate_admin!, only: [:destroy_by_admin]
  # GET /candidates or /candidates.json
  def index
    @candidates = Candidate.all
    @candidates = Candidate.paginate(page: params[:page], per_page: 4)
  end

  # GET /candidates/1 or /candidates/1.json
  def show
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates or /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to candidate_url(@candidate), notice: "Candidate was successfully created." }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1 or /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to candidate_url(@candidate), notice: "Candidate was successfully updated." }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1 or /candidates/1.json
  def destroy
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to candidates_url, notice: "Candidate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Perfil del candidato
  def profile
  end

  # Actualizar perfil del candidato
  def update_profile
    if @candidate.update(candidate_params)
      redirect_to profile_candidate_path(@candidate), notice: "Profile was successfully updated."
    else
      render :profile
    end
  end
  def destroy_by_admin
    @candidate = Candidate.find(params[:id])
    @candidate.destroy
    redirect_to candidates_url, notice: "Candidate was successfully destroyed by the admin."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidate_params
      params.require(:candidate).permit(:name, :experience, :skills, :salary_expectation, :professional_title, :email, :password, :password_confirmation, :profile_picture)
    end
end
