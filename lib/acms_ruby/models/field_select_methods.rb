
module AcmsRuby
  module FieldSelectMethods
    def field(key)
      fields.where(field_key: key).first.value
    end
  end
end
