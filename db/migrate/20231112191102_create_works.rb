class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.references      :user, foreign_key: true
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
