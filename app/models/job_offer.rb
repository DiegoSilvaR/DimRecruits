class JobOffer < ApplicationRecord
  # Columns
  has_and_belongs_to_many :candidates, foreign_key: 'user_id'
  validates :title, presence: true
  validates :description, presence: true
  validates :requirements, presence: true
  validates :salary, presence: true  # Cambiar 'salary_range' a 'salary'
end
