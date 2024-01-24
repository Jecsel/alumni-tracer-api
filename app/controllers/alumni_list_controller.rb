class AlumniListController < ApplicationController
    def index
        @alumni_lists = AlumniList.all
        
        render json: { data: @alumni_lists }, status: 200
    end

    def create
        params[:data].each do |lst|
            if params[:'First Name'].present? && params[:'Last Name'].present?
                alumni_list = AlumniList.create(
                    batch_year: lst[:'Batch Year'],
                    first_name: lst[:'First Name'],
                    last_name: lst[:'Last Name'],
                    municipality: lst[:'Munipality']
                );
            else 
                puts "Error: 'First Name' and 'Last Name' cannot be empty or nil."
            end
        end
        
        render json: { message: 'Successfully' }, status: 200
    end
end
