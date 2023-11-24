class JobPost < ApplicationRecord
    belongs_to          :user
    has_one_attached    :image
    has_one_attached    :avatars

    def image_url
        return unless image.attached?
    
        Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
    end
end
