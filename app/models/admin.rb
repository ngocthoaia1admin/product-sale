class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  UPDATABLE_COLUMNS_FOR_ADMINS = [:name, :email, :password, :password_confirmation]
  devise :database_authenticatable, :rememberable, :trackable, :validatable
end
