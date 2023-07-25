class Candidate < ApplicationRecord
  # Active Storage
  has_one_attached :profile_picture
  has_and_belongs_to_many :job_offers, dependent: :destroy  # Agregar dependent: :destroy
  # Devise modules :registerable,
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

         enum role: [:candidate, :recruit, :admin]

  # Columns
  validates :name, presence: true
  validates :experience, presence: true
  validates :skills, presence: true
  validates :salary_expectation, presence: true
  validates :professional_title, presence: true

end

