class Product < ActiveRecord::Base
  UPDATABLE_COLUMNS_FOR_ADMINS = [:name, :description, :price, :product_line]
  validates :name,          presence: true
  validates :description,   presence: true
  mount_uploader :image, ImageUploader
end
