class Work < ApplicationRecord
    belongs_to          :user
    belongs_to :alumni_main, foreign_key: 'user_id'
end
