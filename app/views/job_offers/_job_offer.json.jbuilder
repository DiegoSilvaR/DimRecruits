json.extract! job_offer, :id, :title, :description, :requirements, :salary, :expiration_date, :created_at, :updated_at
json.url job_offer_url(job_offer, format: :json)
