class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :fprice
end
