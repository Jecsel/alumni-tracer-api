class User < ApplicationRecord
    before_create :encrypt_password
    has_one             :alumni_main
    has_one             :work
    belongs_to          :user_type
    belongs_to          :user_role
    
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
