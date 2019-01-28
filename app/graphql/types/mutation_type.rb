module Types
  class MutationType < Types::BaseObject

    # field :EditContact, field: ContactMutations::Edit.field
    field :create_contact, mutation: Mutations::CreateContact

    # field :EditCase, field: CaseMutations::Edit.field
    field :create_case, mutation: Mutations::CreateCase
    
    field :AssignContact, mutation: Mutations::AssignContact

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
