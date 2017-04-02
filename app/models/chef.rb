class Chef < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :chefname, presence: true, length: {maximum: 30}
  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, presence:true, length: {maximum: 255}, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}


  has_many :recipes

end
