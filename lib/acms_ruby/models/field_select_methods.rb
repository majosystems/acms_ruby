
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

    def image_field_names
      field_names.collect do |name|
        image_name = name.split('@')[0]
        image_name if name =~ /\@/ && image_name != ''
      end.uniq.compact
    end
  end
end
