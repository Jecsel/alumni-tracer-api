class ChangeDateTypeInEventPosts < ActiveRecord::Migration[6.1]
  def up
    change_column :event_posts, :date, 'date USING date::date'
  end

  def down
    change_column :event_posts, :date, :string
  end
end
