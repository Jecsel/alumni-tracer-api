class CreateAlumniLists < ActiveRecord::Migration[6.1]
  def change
    create_table :alumni_lists do |t|
      t.string :batch_year
      t.string :first_name
      t.string :last_name
      t.string :municipality

      t.timestamps
    end
  end
end
