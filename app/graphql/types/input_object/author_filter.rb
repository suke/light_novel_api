module Types
  module InputObject
    class AuthorFilter < Types::InputObject::BaseInputObject
      argument :OR, [self], required: false
      argument :page, Integer, required: false, default_value: 1
      argument :max_page_size, Integer, required: false, default_value: 10
      argument :name, String, required: true
    end
  end
end
