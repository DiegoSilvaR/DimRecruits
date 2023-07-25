class Recruiter < ApplicationRecord
  # Columns
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
