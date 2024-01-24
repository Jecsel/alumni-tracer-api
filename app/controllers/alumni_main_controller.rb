class AlumniMainController < ApplicationController
    # before_action :must_be_authenticated
    # skip_before_action :verify_authenticity_token
    before_action :set_alumni_main, only: [:destroy]

    def index
        alumni = AlumniMain.all
        render json: {data: alumni}, status: 200
    end 

    def dashboard_count
        alumni =  User.joins(:alumni_main, :work).count
        job_posts = JobPost.all.count
        event_posts = EventPost.all.count

        datasets = []
        labels = AlumniMain.distinct.pluck(:batch_year).reverse.sort

        dataAll = {
            label: "All",
            data: [],
            fill: false,
            backgroundColor: "rgb(250, 177, 5)",
            borderColor: "rgb(255, 205, 86)",
            tension: 0.8,
        }

        # dataEmployed = {
        #     label: "Employed",
        #     data: [],
        #     fill: false,
        #     backgroundColor: "#40ed7d",
        #     borderColor: "#269920",
        #     tension: 0.4,
        # }

        dataUnemployed = {
            label: "Unemployed",
            data: [],
            fill: false,
            backgroundColor: "#4b59eb",
            borderColor: "#202ba1",
            tension: 0.4,
        }

        dataEmployee = {
            label: "Employed",
            data: [],
            fill: false,
            backgroundColor: "#e8647a",
            borderColor: "#ff002b",
            tension: 0.4,
        }

        dataSelfEmployed = {
            label: "Self Employed",
            data: [],
            fill: false,
            backgroundColor: "#f5f754",
            borderColor: "#fbff00",
            tension: 0.4,
        }


        labels.each do |year|
            dataAll[:data] << AlumniMain.where(batch_year: year).count
            dataUnemployed[:data]<<AlumniMain.joins(:work).where(batch_year: year, works: { work_type: 'unemployed' }).count 
            dataEmployee[:data]<<AlumniMain.joins(:work).where(batch_year: year, works: { work_type: 'employed' }).count 
            dataSelfEmployed[:data]<<AlumniMain.joins(:work).where(batch_year: year, works: { work_type: 'self employed' }).count 
        end

        datasets << dataAll
        # datasets << dataEmployed
        datasets << dataUnemployed
        datasets << dataEmployee
        datasets << dataSelfEmployed

        lineData = {
            labels: labels,
            datasets: datasets
        }


        render json: { alumni: alumni, job_posts: job_posts, event_posts: event_posts, lineData: lineData}, status: 200

        # render json: { alumni: alumni, job_posts: job_posts, event_posts: event_posts }
    end

    def registeredAlumniDataChart
        alumni = AlumniMain.all.count
        job_posts = JobPost.all.count
        event_posts = EventPost.all.count

        datasets = []
        labels = AlumniMain.distinct.pluck(:batch_year).reverse.sort

        dataAll = {
            label: "All",
            data: [],
            fill: true,
            backgroundColor: "rgb(250, 177, 5)",
            borderColor: "rgb(255, 205, 86)",
            tension: 0.8,
        }

        labels.each do |year|
            dataAll[:data] << AlumniMain.where(batch_year: year).count
        end

        datasets << dataAll

        lineData = {
            labels: labels,
            datasets: datasets
        }


        render json: { alumni: alumni, job_posts: job_posts, event_posts: event_posts, lineData: lineData}, status: 200
    end

    def getItRelateData
        labels = AlumniMain.distinct.pluck(:batch_year).reverse.sort
        isItRelatedData = {
            labels: ['Yes', 'No'],
            datasets: [
                {
                    data: [],
                    backgroundColor: [
                        "rgb(54, 162, 235)",
                        "rgb(255, 99, 132)",
                        "rgb(255, 205, 86)",
                        "rgb(75, 192, 192)",
                    ],
                },
            ],
        };
        year = params[:year]

        
        # isItRelatedData[:datasets][0][:data] << AlumniMain.joins(:work).where(batch_year: year, works: { is_it_related: true }).count 
        # isItRelatedData[:datasets][0][:data] << AlumniMain.joins(:work).where(batch_year: year, works: { is_it_related: false }).count 
        isItRelatedData[:datasets][0][:data] << Work.where(is_it_related: true).count 
        isItRelatedData[:datasets][0][:data] << Work.where(is_it_related: false).count  
        
        render json: {data: isItRelatedData}, status: 200
    end

    def getIsGovSect
        labels = AlumniMain.distinct.pluck(:batch_year).reverse.sort
        isGovSect = {
            labels: ['Government', 'Private'],
            datasets: [
                {
                    data: [],
                    backgroundColor: [
                        "rgb(54, 162, 235)",
                        "rgb(255, 99, 132)"
                    ],
                },
            ],
        };
        year = params[:year]

        
        # isGovSect[:datasets][0][:data] << AlumniMain.joins(:work).where(batch_year: year, works: { is_gov_sect: true }).count 
        # isGovSect[:datasets][0][:data] << AlumniMain.joins(:work).where(batch_year: year, works: { is_gov_sect: false }).count 

        isGovSect[:datasets][0][:data] << Work.where(is_gov_sect: true).count 
        isGovSect[:datasets][0][:data] << Work.where(is_gov_sect: false).count 


        
        render json: {data: isGovSect}, status: 200
    end

    def batchYearList
        alumni = AlumniMain.distinct.pluck(:batch_year)

        alumni.map { |alu| { label: alu, value: alu} }

        render json: {data: alumni}, status: 200
    end

    def alumniGroupByBatch
        alumni =AlumniMain.all
        alumni_group = AlumniMain.all.group_by { |alumni| alumni.batch_year }

        render json: {data: alumni, group: alumni_group, total: AlumniMain.all.count }, status:200
    end

    def alumniPerBatch

        alumni = AlumniMain.where(batch_year: params[:batch_year])

        render json: {data: alumni }, status:200
    end

    def alumniGroupByWorkType
        alumni = AlumniMain.joins(:work).group_by { |alumni| alumni.work.work_type }
        render json: {data: alumni }, status:200
    end

    def alumniPerWorkType
        alumni = AlumniMain.joins(:work).where(works: { is_working: params[:work_type] })
        render json: {data: alumni }, status:200
    end

    def joinAlumniWork
        alumni = User.joins(:alumni_main, :work)
        alumnus = []
        alumni.each do |user|
            data = {
                id: user.alumni_main.id,
                user_id: user.id,
                first_name: user.alumni_main.first_name,
                last_name: user.alumni_main.last_name,
                batch_year: user.alumni_main.batch_year,
                dob: user.alumni_main.dob,
                age: user.alumni_main.age,
                civil_status: user.alumni_main.civil_status == 1 ? 'Single' : 'Married',
                gender: user.alumni_main.gender == 1 ? 'Male' : 'Female',
                region: user.alumni_main.region,
                province: user.alumni_main.province,
                municipality: user.alumni_main.municipality,
                barangay: user.alumni_main.barangay,
                course: user.alumni_main.course,
                email_address: user.alumni_main.email_address,
                phone_number: user.alumni_main.phone_number,
                work_status: user.work.is_working == 'yes' ? 'Working' : 'Not Working',
                work_sector: user.work.is_gov_sect ? 'Government' : 'Private',
                it_related: user.work.is_it_related ? 'YES' : 'NO',
                work_type:  user.work.work_type,
                work_position: user.work.work_position,
                business_name: user.work.business_name,
                company_name: user.work.company_name,
                company_address: user.work.company_address,
                company_acronym: user.work.company_acronym,
                type_of_business: user.work.type_of_business,
                area_of_business: user.work.area_of_business,
                business_address: user.work.business_address
            }

            alumnus << data
        end
        # grouped_alumni = alumnus.group_by { |alum| alum[:batch_year] }

        render json: {data: alumnus}, status: 200
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

    def updateAlumniImage
        alumni_p = AlumniMain.last

        p "==== image ====="
        p params[:image]
        
        if alumni_p.update(image: params[:image])
          render json: { message: 'Image updated successfully' }, status: :ok
        else
          render json: { error: 'Failed to update image' }, status: :unprocessable_entity
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
        alumni_work = user.work

        render json: { data: alumni_main, work: alumni_work, image_url: alumni_main.image.attached? ? rails_blob_url(alumni_main.image, only_path: true) : nil }, status: 200
    end

    def destroy
        @alumni_main.destroy
        render json: { message: 'AlumniMain deleted successfully' }, status: 200
    end

    private

    def set_alumni_main
        @alumni_main = AlumniMain.find(params[:id])
      end

    def alumni_params
        params
          .require(:user)
          .permit(
            :user_id, :first_name, :middle_name, :last_name, :batch_year,
            :dob, :age, :civil_status, :gender, :region, :province, :municipality, :barangay,
            :course, :year_graduated, :email_address, :phone_number, :image
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
