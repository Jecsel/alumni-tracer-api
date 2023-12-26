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
                line_of_busines: work_params[:line_of_busines],
                is_it_related: work_params[:is_it_related],
                is_gov_sect: work_params[:is_gov_sect]
            )
            alumni_work.save

            render json: {message: "Successfully Personal Info.", alumni_work: alumni_work }, status: 200
        else
            render json: {message: "Please check administrator" }, status: 500
        end
    end

    def updateWork
        
        user = User.find update_params[:user_id]
        work = user.work

        work.update(
            is_working: update_params[:is_working],
            work_position: update_params[:work_position],
            business_name: update_params[:business_name],
            company_name: update_params[:company_name],
            company_address: update_params[:company_address],
            company_acronym: update_params[:company_acronym],
            type_of_business: update_params[:type_of_business],
            area_of_business: update_params[:area_of_business],
            business_address: update_params[:business_address],
            business_acronym: update_params[:business_acronym],
            business_related: update_params[:business_related],
            line_of_busines: update_params[:line_of_busines],
            is_it_related: work_params[:is_it_related],
            is_gov_sect: work_params[:is_gov_sect]
        )

        render json: {message: "User work updated!", data: work }, status: 200
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
            :line_of_busines, :is_it_related, :is_gov_sect
          )
    end

    def update_params
        params
        .require(:user)
        .permit(
            :user_id, :is_working, :work_position, :business_name, :company_name, :company_address, :company_acronym,
            :type_of_business, :area_of_business, :business_address, :business_acronym, :business_related,
            :line_of_busines, :work_type, :is_it_related, :is_gov_sect
        )
    end

end
