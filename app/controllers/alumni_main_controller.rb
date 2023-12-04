class AlumniMainController < ApplicationController
    # before_action :must_be_authenticated
    # skip_before_action :verify_authenticity_token

    def index
        alumni = AlumniMain.all
        render json: {data: alumni}, status: 200
    end 

    def dashboard_count
        alumni = AlumniMain.all.count
        job_posts = JobPost.all.count
        event_posts = EventPost.all.count

        render json: { alumni: alumni, job_posts: job_posts, event_posts: event_posts }
    end

    def create
        user = User.find alumni_params[:user_id]

        if user.present?
            alumni_main = user.build_alumni_main(
                first_name: alumni_params[:first_name], 
                middle_name: alumni_params[:middle_name], 
                last_name: alumni_params[:last_name], 
                batch_year: alumni_params[:batch_year],
                dob: alumni_params[:dob],
                age: alumni_params[:age],
                civil_status: alumni_params[:civil_status],
                gender: alumni_params[:gender],
                region: alumni_params[:region],
                province: alumni_params[:province],
                municipality: alumni_params[:municipality],
                barangay: alumni_params[:barangay],
                course: alumni_params[:course], 
                year_graduated: alumni_params[:year_graduated],
                email_address: alumni_params[:email_address],
                phone_number: alumni_params[:phone_number]
            )
            alumni_main.save

            render json: {message: "Successfully Personal Info.", alumni_main: alumni_main }, status: 200
        else
            render json: {message: "User not Found", alumni_main: alumni_main }, status: 404
        end
    end
    
    def updateAlumni
        alumni = AlumniMain.find alumni_update_params[:id]

        if alumni.present?
            alumni.update(
                first_name: alumni_update_params[:first_name], 
                middle_name: alumni_update_params[:middle_name], 
                last_name: alumni_update_params[:last_name], 
                batch_year: alumni_update_params[:batch_year],
                dob: alumni_update_params[:dob],
                age: alumni_update_params[:age],
                civil_status: alumni_update_params[:civil_status],
                gender: alumni_update_params[:gender],
                region: alumni_update_params[:region],
                province: alumni_update_params[:province],
                municipality: alumni_update_params[:municipality],
                barangay: alumni_update_params[:barangay],
                course: alumni_update_params[:course], 
                year_graduated: alumni_update_params[:year_graduated],
                email_address: alumni_update_params[:email_address],
                phone_number: alumni_update_params[:phone_number]
            )

            render json: {message: "Successfully updated.", alumni_main: alumni }, status: 200
        else
            render json: {message: "User not Found" }, status: 404
        end
    end

    def show
        user = User.find params[:id]
        alumni_main = user.alumni_main

        render json: { data: alumni_main }, status: 200
    end

    private

    def alumni_params
        params
          .require(:user)
          .permit(
            :user_id, :first_name, :middle_name, :last_name, :batch_year,
            :dob, :age, :civil_status, :gender, :region, :province, :municipality, :barangay,
            :course, :year_graduated, :email_address, :phone_number
          )
    end

    def alumni_update_params
        params
          .require(:user)
          .permit(
            :id, :first_name, :middle_name, :last_name, :batch_year,
            :dob, :age, :civil_status, :gender, :region, :province, :municipality, :barangay,
            :course, :year_graduated, :email_address, :phone_number
          )
    end

end
