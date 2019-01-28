module Types
  class ContactType < BaseObject
    field :id, ID, null: false
    # `created_at` is automatically camelcased to `createdAt`
    # field :created_at, DateTimeType, null: false
    field :firstname, String, null: false
    field :lastname, String, null: false
    field :caserole, String, null: false
    field :email, String, null: false
    field :case, CaseType, null: true
  end
end
