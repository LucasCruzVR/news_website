class Publication < ApplicationRecord
    attr_accessor :file_image

    # Validations
    validates :title, :subtitle, :content, presence: true
end
