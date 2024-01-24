class CreateEventPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :event_posts do |t|
      t.references      :user, foreign_key: true
      t.string          :title
      t.string          :venue
      t.datetime        :date_from
      t.datetime        :date_to
      t.string          :sponsor
      t.integer         :status,     default: 0
      t.boolean         :is_active,   default: false

      t.timestamps
    end
  end
end
