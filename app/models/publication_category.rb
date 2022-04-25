class PublicationCategory < ApplicationRecord
  # Associations
  belongs_to :publication
  belongs_to :category
end
