class Mutations::AssignContact < Mutations::BaseMutation
    argument :contactid, String, required: true
    argument :caseid, String, required: false

    field :case, Types::CaseType, null: true
    field :contact, Types::ContactType, null: true
    field :errors, [String], null: false

    def resolve(**args)

      contact = Contact.find(args[:contactid])

      if args[:caseid].present?
        c = Case.find(args[:caseid])
        contact.case = c
        contact.save
      else
        contact.update_column(:case_id, nil)
      end

      {
        contact: contact,
        errors: [],
      }

    end
  end
