class User < ActiveRecord::Base
	has_secure_password 

	has_attached_file :avatar, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing."
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	has_many :user_interests, dependent: :destroy
	has_many :interests, through: :user_interests
	 
	validates :full_name, presence: true, length: {minimum: 5 }, on: :create
	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, on: :create
	validates :password, presence: true, length: { minimum: 5 }, on: :create 

	before_save do
  self.interests.gsub!(/[\[\]\"]/, "") if attribute_present?("interests")
	end

end
