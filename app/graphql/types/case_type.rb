module Types
  class CaseType < BaseObject
    field :id, ID, null: false
    # `created_at` is automatically camelcased to `createdAt`
    # field :created_at, DateTimeType, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :value, Float, null: false
    field :courtdate, DateTimeType, null: false
    field :contacts, [Types::ContactType], null: true
  end
end
