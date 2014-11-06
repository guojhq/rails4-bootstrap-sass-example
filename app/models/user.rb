class User < ActiveRecord::Base
  has_secure_password

  has_one :profile

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def admin?
    self.role == 'admin'
  end
end
