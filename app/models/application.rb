class Application < ApplicationRecord
  # Relationships
  belongs_to :candidate
  belongs_to :job_offer

  # Columns
  validates :cover_letter, presence: true
end
