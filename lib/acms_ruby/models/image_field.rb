
module AcmsRuby
  class ImageField
    include Enumerable
    attr_accessor :fields
    attr_accessor :name

    def initialize(field_name, base)
      @base = base
      @name = field_name
      load_image
    end

    def load_image
      @fields = @base.fields.where(['field_key like ?', @name+"@%"])
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
