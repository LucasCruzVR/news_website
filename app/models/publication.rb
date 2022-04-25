class Publication < ApplicationRecord
  attr_accessor :file_image

  # Validations
  validates :title, :subtitle, :content, presence: true

  # Associations
  has_many :publications_categories, dependent: :destroy
  has_many :categories, through: :publications_categories

  accepts_nested_attributes_for :publications_categories, allow_destroy: true
end
