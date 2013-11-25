
module AcmsRuby
  module FieldSelectMethods
    def field(key, sort_no=nil)
      return fields.where(field_key: key, field_sort: sort_no).first if sort_no
      fields.where(field_key: key).collect do |field|
        field
      end
    end

    def val(key, sort_no=nil)
      return field(key, sort_no) if sort_no
      field(key).collect do |f|
        f.value
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

    def field_group_names
      field_names.collect do |name|
        image_name = name.split('@')[1]
        image_name if name =~ /^\@/
      end.compact
    end

    def field_groups
      field_group_names.collect do |group_name|
        AcmsRuby::FieldGroup.new(group_name, self)
      end
    end

    def image_fields
      image_field_names.collect do |image_name|
        AcmsRuby::ImageField.new(image_name, self)
      end
    end
  end
end
