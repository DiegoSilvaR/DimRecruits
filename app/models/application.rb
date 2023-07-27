class Application < ApplicationRecord
  # Relationships
  belongs_to :candidate
  belongs_to :job_offer
  has_one_attached :cover_letter
  def attachment_file_name
    cover_letter.attached? ? cover_letter.filename.to_s.split("/").last : ""
  end
  validates :cover_letter, presence: true
end
