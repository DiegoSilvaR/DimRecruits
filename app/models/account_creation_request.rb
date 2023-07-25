class AccountCreationRequest < ApplicationRecord
  validates :name, :email, :experience, :skills, :salary_expectation, :professional_title, presence: true

  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.urlsafe_base64(20)
  end
end
