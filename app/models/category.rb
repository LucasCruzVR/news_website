class Category < ApplicationRecord
  # Validations
  validates :name, presence: true, uniquiness: { case_sensistive: false }
end
