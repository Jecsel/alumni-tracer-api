class WorkController < ApplicationController
    # before_action :must_be_authenticated

    def index
    end

    def create
        user = User.find work_params[:user_id]

        if user.present?
            alumni_work = user.build_work(
                is_working: work_params[:is_working], 
                work_type: work_params[:work_type], 
                work_position: work_params[:work_position], 
                business_name: work_params[:business_name],
                company_name: work_params[:company_name],
                company_address: work_params[:company_address],
                company_acronym: work_params[:company_acronym],
                type_of_business: work_params[:type_of_business],
                area_of_business: work_params[:area_of_business],
                business_address: work_params[:business_address],
                business_address: work_params[:business_address],
                business_acronym: work_params[:business_acronym],
                business_related: work_params[:business_related], 
                line_of_busines: work_params[:line_of_busines]
            )
            alumni_work.save

            render json: {message: "Successfully Personal Info.", alumni_work: alumni_work }, status: 200
        else
            render json: {message: "Please check administrator" }, status: 500
        end
    end

    def show
        user = User.find params[:id]
        alumni_work = user.work

        render json: { data: alumni_work }, status: 500
    end

    private

    def work_params
        params
          .require(:user)
          .permit(
            :user_id, :is_working, :work_type, :work_position, :business_name,
            :company_name, :company_address, :company_acronym, :type_of_business, :area_of_business, :business_address, :business_acronym, :business_related,
            :line_of_busines
          )
    end
end