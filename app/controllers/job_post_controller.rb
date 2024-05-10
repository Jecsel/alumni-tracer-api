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
                deployment_date: job_post.deployment_date,
                active_date: job_post.active_date,
                qualification: job_post.qualification,
                status: job_post.status,
                is_active: job_post.is_active,
                created_at: job_post.created_at,
                updated_at: job_post.updated_at,
                job_postee_owner: job_post.user.user_type_id == 2 ? 'Admin' : job_post.user.alumni_main.full_name,
                job_seeker_email: job_post.job_seeker_email,
                job_seeker_contact: job_post.job_seeker_contact,  
                image_url: job_post.image.attached? ? rails_blob_url(job_post.image, only_path: true) : nil
            }
          end
      
        render json: {data: json_array}, status: 200
    end

    def userJobPosts
      user_id = params[:user_id]
      @job_posts = JobPost.where(user_id: user_id).includes(:image_attachment).select { |job_post| job_post.image.attached? }.sort_by(&:created_at).reverse

      json_array = @job_posts.map do |job_post|
          {
              id: job_post.id,
              company_name: job_post.company_name,
              company_email: job_post.company_email,
              company_address: job_post.company_address,
              position: job_post.position,
              deployment_date: job_post.deployment_date,
              active_date: job_post.active_date,
              qualification: job_post.qualification,
              job_postee_owner: job_post.user.user_type_id == 2 ? 'Admin' : job_post.user.alumni_main.full_name,
              job_seeker_email: job_post.job_seeker_email,
              job_seeker_contact: job_post.job_seeker_contact,
              status: job_post.status,
              is_active: job_post.is_active,
              created_at: job_post.created_at,
              updated_at: job_post.updated_at,
              image_url: job_post.image.attached? ? rails_blob_url(job_post.image, only_path: true) : nil
          }
        end
    
      render json: {data: json_array}, status: 200
  end

  def currentActiveJobs
    @job_posts = JobPost.includes(:image_attachment).select { |job_post| job_post.image.attached? }.select { |job_post| job_post.active_date > Time.now }.sort_by(&:created_at).reverse

    json_array = @job_posts.map do |job_post|
        {
            id: job_post.id,
            company_name: job_post.company_name,
            company_email: job_post.company_email,
            company_address: job_post.company_address,
            position: job_post.position,
            deployment_date: job_post.deployment_date,
            active_date: job_post.active_date,
            qualification: job_post.qualification,
            job_postee_owner: job_post.user.user_type_id == 2 ? 'Admin' : job_post.user.alumni_main.full_name,
            job_seeker_email: job_post.job_seeker_email,
            job_seeker_contact: job_post.job_seeker_contact,
            status: job_post.status,
            is_active: job_post.is_active,
            created_at: job_post.created_at,
            updated_at: job_post.updated_at,
            image_url: job_post.image.attached? ? rails_blob_url(job_post.image, only_path: true) : nil
        }
      end
  
    render json: {data: json_array}, status: 200
  end

  def updateJob
    job_post = JobPost.find update_job_params[:id]

    job_post.update(update_job_params)

    render json: {message: 'Job Post successfully updated.'}, status: 200
  end


    def currentActiveApproveJobs
      @job_posts = JobPost.includes(:image_attachment).select { |job_post| job_post.image.attached? }.select { |job_post| job_post.status == 1 }.sort_by(&:created_at).reverse
      # @job_posts = JobPost.includes(:image_attachment).select { |job_post| job_post.image.attached? }.select { |job_post| job_post.active_date > Time.now - 1.day }.select { |job_post| job_post.status == 1 }.sort_by(&:created_at).reverse

      json_array = @job_posts.map do |job_post|
          {
              id: job_post.id,
              company_name: job_post.company_name,
              company_email: job_post.company_email,
              company_address: job_post.company_address,
              position: job_post.position,
              deployment_date: job_post.deployment_date,
              active_date: job_post.active_date,
              qualification: job_post.qualification,
              status: job_post.status,
              job_postee_owner: job_post.user.user_type_id == 2 ? 'Admin' : job_post.user.alumni_main.full_name,
              job_seeker_email: job_post.job_seeker_email,
              job_seeker_contact: job_post.job_seeker_contact,
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

    def acceptJob
      job_post = JobPost.find params[:job_post_id]

      job_post.update(status: 1)

      render json: { message: 'Job successfully updated'}, status: 200
    end

    def rejectJob
      job_post = JobPost.find params[:job_post_id]

      job_post.update(status: 2)

      render json: { message: 'Job successfully updated'}, status: 200
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
            .permit(:user_id, :company_name, :company_email, :position, :company_address, :date_of_submission, :date_posted, :qualification, :job_seeker_email, :job_seeker_contact, :deployment_date, :active_date)
    end

    def update_job_params
      params
          .require(:job)
          .permit(:id, :company_name, :company_email, :position, :company_address, :date_of_submission, :date_posted, :qualification, :job_seeker_email, :job_seeker_contact, :deployment_date, :active_date)
  end
        
end
