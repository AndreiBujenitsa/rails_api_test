class Product < ActiveRecord::Base
  validates :name, :description, :price, presence: true
  validates :price, numericality: true
end
