module Types
  class QueryType < Types::BaseObject
    # queries are just represented as fields
    # `all_links` is automatically camelcased to `allLinks`

    field :all_contacts, [ContactType], null: false
    field :contact, ContactType, null: true do
      description "Find an contact by id"
      argument :id, String, required: true
    end

    field :all_cases, [CaseType], null: false
    field :case, CaseType, null: true do
      description "Find an case by id"
      argument :id, String, required: true
    end

    # this method is invoked, when `all_link` fields is beeing resolved
    def all_contacts
      Contact.all
    end
    def contact(id:)
      Contact.find(id)
    end

    def all_cases
      Case.all
    end
    def case(id:)
      Case.find(id)
    end
  end
end
