class User < ActiveRecord::Base

  # relationships
  has_many :forums
  has_many :forum_posts
  has_many :forum_threads

  belongs_to :role

  # validations
  validates :first_name, :last_name, presence: true, length: { maximum: 100 }
  validates :password, presence: true
  validates :email, presence: true, email: true, uniqueness: true, length:  { maximum: 200 }

  # call_backs
  before_save { self.full_name = (self.first_name + ' ' + self.last_name).strip }

  def password=(pass)
    super(Digest::MD5.hexdigest(pass)) if pass
  end

end
