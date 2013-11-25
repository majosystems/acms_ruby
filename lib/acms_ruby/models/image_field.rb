
module AcmsRuby
  class ImageField
    include Enumerable
    attr_accessor :fields
    attr_accessor :images
    attr_accessor :name

    def initialize(field_name, base)
      @base = base
      @name = field_name
      load_image
    end

    def load_image
      @fields = @base.fields.where(['field_key like ?', @name+"@%"])
      image_count = @fields.collect{|f| f.field_sort }.max
      image_count.time_with_index do |i|
        Image.new(@name, i+1, @base)
      end
    end

    def field(key, sort_no=nil)
      key = @name+'@'+key
      return nil if !field_names.include?(key)
      @base.field(key, sort_no)
    end

    def field_names
      @fields.collect do |field|
        field.key
      end.uniq
    end

    def each
      @fields.each do |field|
        yield field
      end
    end
  end
end
