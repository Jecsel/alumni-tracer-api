class AddJobSeekerEmailAndJobSeekerContactToJobPost < ActiveRecord::Migration[6.1]
  def change
    add_column :job_posts, :job_seeker_email, :string
    add_column :job_posts, :job_seeker_contact, :string
  end
end
