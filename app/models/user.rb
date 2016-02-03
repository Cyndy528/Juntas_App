class User < ActiveRecord::Base
	has_secure_password 

	has_secure_password
	has_attached_file :avatar, 
                      styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>"}, 
                      storage: :s3,
                      s3_credentials: Proc.new { |a| a.instance.s3_credentials },
                      s3_host_name: 's3-us-west-2.amazonaws.com',
                      path: "users/:id/:style/image.:extension",
                      default_url: ""
                      
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	has_many :user_interests, dependent: :destroy
	has_many :interests, through: :user_interests
	 
	validates :full_name, presence: true, length: {minimum: 5 }, on: :create
	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, on: :create
	validates :password, presence: true, length: { minimum: 5 }, on: :create 

	before_save do
  self.interests.gsub!(/[\[\]\"]/, "") if attribute_present?("interests")
	end

	def s3_credentials
  	{ :bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_PUBLIC_KEY'], :secret_access_key => ENV['S3_SECRET'] }
  end

end
