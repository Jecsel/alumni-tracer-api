class CreateAlumniMains < ActiveRecord::Migration[6.1]
  def change
    create_table :alumni_mains do |t|
      t.references      :user, foreign_key: true
      t.string          :first_name
      t.string          :middle_name
      t.string          :last_name
      t.integer         :batch_year
      t.date            :dob
      t.integer         :age
      t.integer         :civil_status
      t.integer         :gender
      t.string          :region    
      t.string          :province
      t.string          :municipality
      t.string          :barangay
      t.string          :course
      t.integer         :year_graduated
      t.string          :email_address
      t.string          :phone_number   
      t.string          :is_working
      t.string          :work_type
      t.string          :work_position
      t.string          :business_name
      t.string          :company_name
      t.string          :company_address
      t.string          :company_acronym
      t.string          :type_of_business
      t.string          :area_of_business
      t.string          :business_address
      t.string          :business_acronym
      t.string          :business_related
      t.string          :line_of_busines

      t.timestamps
    end
  end
end
