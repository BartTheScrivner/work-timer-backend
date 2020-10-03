class User < ApplicationRecord
  has_many :projects
  has_many :tasks, through: :projects
  has_many :tags, through: :tasks
  # NAME VALIDATIONS
  validates :first_name,  presence: true, length: { maximum: 30 }
  validates :last_name,  presence: true, length: { maximum: 30 }
  
  # EMAIL VALIDATIONS
  before_save { self.email = email.downcase } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, :on => :create,
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  
  # PASSWORD VALIDATIONS
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, :on => :create

  def name
    self.first_name + " " + self.last_name
  end

  
end
