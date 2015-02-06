#email: admin@admin.com
#password: admin12345
class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
