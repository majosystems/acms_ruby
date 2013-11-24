
module AcmsRuby
  class FieldGroup
    include Enumerable
    attr_accessor :fields
    attr_accessor :name

    def initialize(group_name, base)
      @base = base
      @name = group_name
      load_fields
    end

    def load_fields
      @fields = @base.fields.where(field_key: "@"+@name)
    end

    def field(key, sort_no=nil)
      return nil if !field_names.include?(key)
      @base.field(key, sort_no)
    end

    def field_names
      @fields.collect do |field|
        field.value
      end.uniq
    end

    def each
      @fields.each do |field|
        yield field
      end
    end
  end
end
