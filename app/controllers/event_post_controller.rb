class EventPostController < ApplicationController

    def index

        @event_posts = EventPost.includes(:image_attachment).select { |event_post| event_post.image.attached? }.sort_by(&:created_at).reverse

        json_array = @event_posts.map do |event_post|
            {
                id: event_post.id,
                title: event_post.title,
                venue: event_post.venue,
                date: event_post.date,
                time: event_post.time,
                sponsor: event_post.sponsor,
                status: event_post.status,
                is_active: event_post.is_active,
                image_url: event_post.image.attached? ? rails_blob_url(event_post.image, only_path: true) : nil
            }
          end
      
        render json: {data: json_array}, status: 200
    end

    def getCurrentEvents

        @event_posts = EventPost.includes(:image_attachment).select { |event_post| event_post.image.attached? }.select { |event_post| event_post.date == Time.now.to_date }.sort_by(&:created_at).reverse

        json_array = @event_posts.map do |event_post|
            {
                id: event_post.id,
                title: event_post.title,
                venue: event_post.venue,
                date: event_post.date,
                time: event_post.time,
                sponsor: event_post.sponsor,
                status: event_post.status,
                is_active: event_post.is_active,
                image_url: event_post.image.attached? ? rails_blob_url(event_post.image, only_path: true) : nil
            }
          end
      
        render json: {data: json_array}, status: 200
    end

    def updateEvent
        event_post = EventPost.find event_update_params[:id]
        event_post.update(event_update_params)

        render json: { message: 'Event Post successfully update.'}, status: 200
    end

    def getUpcomingEvents

        @event_posts = EventPost.includes(:image_attachment).select { |event_post| event_post.image.attached? }.select { |event_post| event_post.date > Time.now.to_date }.sort_by(&:created_at).reverse

        json_array = @event_posts.map do |event_post|
            {
                id: event_post.id,
                title: event_post.title,
                venue: event_post.venue,
                date: event_post.date,
                time: event_post.time,
                sponsor: event_post.sponsor,
                status: event_post.status,
                is_active: event_post.is_active,
                image_url: event_post.image.attached? ? rails_blob_url(event_post.image, only_path: true) : nil
            }
          end
      
        render json: {data: json_array}, status: 200
    end

    def create 
        user = User.find event_post_params[:user_id]

        if user.present?
            event_post = user.event_post.create(
                title: event_post_params[:title],
                venue: event_post_params[:venue],
                date: event_post_params[:date],
                time: event_post_params[:time],
                sponsor: event_post_params[:sponsor],
                status: 1
            )

            if event_post.save
                render json: { message: "Event post successfully saved." }, status: 200
            else
                render json: { errors: event_post.errors.full_messages }, status: 422
            end
        else
            render json: {message: "User not Found" }, status: 404
        end
    end

    def acceptEvent
        event_post = EventPost.find params[:job_post_id]
  
        event_post.update(status: 1)
  
        render json: { message: 'Event successfully updated'}, status: 200
      end
  
      def rejectEvent
        event_post = EventPost.find params[:job_post_id]
  
        event_post.update(status: 2)
  
        render json: { message: 'Event successfully updated'}, status: 200
      end

    def updateImage
        event_p = EventPost.last
        
        # p params[:image]

        if event_p.update(image: params[:image])
          render json: { message: 'Image updated successfully' }, status: :ok
        else
          render json: { error: 'Failed to update image' }, status: :unprocessable_entity
        end
    end

    def event_post_params
        params
            .require(:event)
            .permit(:user_id, :title, :venue, :date, :time, :sponsor)
    end

    def event_update_params
        params
            .require(:event)
            .permit(:id, :title, :venue, :date, :time, :sponsor)
    end

end
