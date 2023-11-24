class JobPostSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
  
    attributes :image_url
  
    def image_url
        p "======== object.image ========"
        p object.image.attached?
        img_url = rails_blob_url(object.image, only_path: true) if object.image.attached?
        

        # if object.image.attached?
        #     img_url = rails_blob_url(object.image, only_path: true)
        # else 
        #     img_url = ''
        # end
    end
end
