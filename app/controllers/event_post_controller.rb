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

        # event_posts = EventPost.all.order(created_at: :desc)

        # render json: { data: event_posts }, status: 200
    end

    def create 
        user = User.find event_post_params[:user_id]

        if user.present?
            event_post = user.event_post.create(
                title: event_post_params[:title],
                venue: event_post_params[:venue],
                date: event_post_params[:date],
                time: event_post_params[:time],
                sponsor: event_post_params[:sponsor]
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

end
