
module AcmsRuby
  module FieldSelectMethods
    def field(key, sort_no=nil)
      return fields.where(field_key: key, field_sort: sort_no).first.value if sort_no
      fields.where(field_key: key).collect do |field|
        field.value
      end
    end

    def field_names
      fields.collect do |field|
        field.key
      end.uniq
    end
  end
end
