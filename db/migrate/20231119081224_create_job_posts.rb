class CreateJobPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :job_posts do |t|
      t.references      :user, foreign_key: true
      t.string          :company_name
      t.string          :company_email
      t.string          :company_address
      t.string          :position
      t.string          :date_of_submission
      t.string          :date_posted
      t.string          :qualification
      t.integer         :status,    default: 0
      t.boolean         :is_active, default: false
      t.date            :deployment_date
      t.date            :active_date

      t.timestamps
    end
  end
end
