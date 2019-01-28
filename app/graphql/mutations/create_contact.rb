class Mutations::CreateContact < Mutations::BaseMutation
    argument :firstname, String, required: true
    argument :lastname, String, required: true
    argument :email, String, required: true
    argument :caserole, String, required: true
    argument :case_id, String, required: true

    field :contact, Types::ContactType, null: true
    field :errors, [String], null: false

    def resolve(**args)
      contact = Contact.new(args)
      if contact.save
      {
        contact: contact,
        errors: [],
      }
    else
      {
        contact: nil,
        errors: contact.errors.full_messages,
      }
    end
    end
  end
