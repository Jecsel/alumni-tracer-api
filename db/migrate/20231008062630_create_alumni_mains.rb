class CreateAlumniMains < ActiveRecord::Migration[6.1]
  def change
    create_table :alumni_mains do |t|
      t.references      :user, foreign_key: true
      t.string          :first_name
      t.string          :middle_name
      t.string          :last_name
      t.integer         :batch_year
      t.timestamps
    end
  end
end
