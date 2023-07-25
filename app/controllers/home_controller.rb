class HomeController < ApplicationController

  def index
    @recent_job_offers = JobOffer.order(created_at: :desc).limit(5)
  end
end
