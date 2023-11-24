class User < ApplicationRecord
    before_create :encrypt_password
    has_one             :alumni_main
    has_one             :work
    has_many            :job_post
    has_many            :event_post
    belongs_to          :user_type
    belongs_to          :user_role

    enum status: {
        pending: 0,
        verified: 1,
        rejected: 2
    }
    
    def valid_password? password
        self.password === Digest::MD5.hexdigest(password)[0..19]
    end

    # def has_profile
    #     self.profile.present?
    # end

    private
    
    def encrypt_password
        self.password = Digest::MD5.hexdigest(self.password)[0..19]
    end
end
