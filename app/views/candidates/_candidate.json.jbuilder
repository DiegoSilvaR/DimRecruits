json.extract! candidate, :id, :name, :experience, :skills, :salary_expectation, :professional_title, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
