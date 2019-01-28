class Mutations::CreateCase < Mutations::BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :value, Float, required: true
    argument :courtdate, Types::DateTimeType, required: true

    argument :contact_firstname, String, required: false
    argument :contact_lastname, String, required: false
    argument :contact_email, String, required: false
    argument :contact_caserole, String, required: false

    field :case, Types::CaseType, null: true
    field :contact, Types::ContactType, null: true
    field :errors, [String], null: false

    def resolve(**args)
      c = Case.create(title: args[:title], description: args[:description], value: args[:value], courtdate: args[:courtdate])

      if args[:contact_firstname].present?
        contact = Contact.create(firstname: args[:contact_firstname], lastname: args[:contact_lastname], email: args[:contact_email], caserole: args[:contact_caserole], case_id: c.id)
      end

      {
        case: c,
        errors: [],
      }

    end
  end
