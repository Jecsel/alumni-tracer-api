class JobPostController < ApplicationController

    # def index
    #     @job_posts = JobPost.includes(:image_attachment).all.order(created_at: :desc)

    #     render json: { data: @job_posts }, status: 200
    # end

    def index
        @job_posts = JobPost.includes(:image_attachment).select { |job_post| job_post.image.attached? }.sort_by(&:created_at).reverse

        json_array = @job_posts.map do |job_post|
            {
                id: job_post.id,
                company_name: job_post.company_name,
                company_email: job_post.company_email,
                company_address: job_post.company_address,
                position: job_post.position,
                date_of_submission: job_post.date_of_submission,
                date_posted: job_post.date_posted,
                qualification: job_post.qualification,
                status: job_post.status,
                is_active: job_post.is_active,
                created_at: job_post.created_at,
                updated_at: job_post.updated_at,
                image_url: job_post.image.attached? ? rails_blob_url(job_post.image, only_path: true) : nil
            }
          end
      
        render json: {data: json_array}, status: 200
      end

    def create
        user = User.find(job_post_params[:user_id])
      
        if user.present?
          job_post = user.job_post.create(job_post_params)
      
          if params[:image].present?
            job_post.image.attach(params[:image])
          end
      
          if job_post.save
            render json: { message: "Job post successfully saved.", data: job_post }, status: 200
          else
            render json: { errors: job_post.errors.full_messages }, status: 422
          end
        else
          render json: { message: "User not found." }, status: 404
        end
      end


    def updateImage
        job_p = JobPost.last
        
        # p params[:image]

        if job_p.update(image: params[:image])
          render json: { message: 'Image updated successfully' }, status: :ok
        else
          render json: { error: 'Failed to update image' }, status: :unprocessable_entity
        end
    end
      
    private
      
    def job_post_params
        params
            .require(:job)
            .permit(:user_id, :company_name, :company_email, :position, :company_address, :date_of_submission, :date_posted, :qualification)
    end
      
    
end
