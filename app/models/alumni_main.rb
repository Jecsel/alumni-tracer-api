class AlumniMain < ApplicationRecord
    belongs_to          :user
    has_one_attached    :image
    has_one :work, foreign_key: 'user_id'

    def full_name
        self.first_name + ' ' + self.last_name
    end
end
