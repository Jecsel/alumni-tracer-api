class AlumniMain < ApplicationRecord
    belongs_to          :user
    has_one :work, foreign_key: 'user_id'
end
