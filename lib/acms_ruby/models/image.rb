
module AcmsRuby
  class Image
    def initialize(image_name, sort_no, base)
      @base = base
      @name = image_name
      @no = sort_no
      load_fields
    end

    def load_fields
      @fields = @base.fields.where(field_sort: @no)
    end

    def field(key)
      key = @name+'@'+key
      @fields(field_key: key).value
    end
  end
end
