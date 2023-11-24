class CreateEventPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :event_posts do |t|
      t.references      :user, foreign_key: true
      t.string          :title
      t.string          :venue
      t.string          :date
      t.string          :time
      t.string          :sponsor
      t.integer          :status,     default: 0
      t.boolean         :is_active,   default: false

      t.timestamps
    end
  end
end
