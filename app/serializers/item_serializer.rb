class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :created_at, :user_id, :completed, :active, :expired
end
