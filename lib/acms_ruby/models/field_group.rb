
module AcmsRuby
  class FieldGroup
    include Enumerable

    def initialize(group_name, base)
      @base = base
      @group_name = groupe_name
      load_fields
    end

    def load_fields
      @fields = @base.fields.where(field_key: "@"+@group_name)
    end

    def each
      @fields.each do |field|
        yield field
      end
    end
  end
end
