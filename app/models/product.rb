class Product < ActiveRecord::Base
  validates :name, :description, :price, presence: true
  validates :price, numericality: true

  scope :formatted, ->{ select("products.*, to_char(products.price, 'FM$999,999,999,990D00') as fprice") } 

  def fprice
    attributes['fprice']
  end
end
