class API::V1::PackageSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price_cents, :currency, :limit_up, :limit_down
end