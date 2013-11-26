
ActiveRecord::Base.default_timezone = :local
ActiveRecord::Base.time_zone_aware_attributes = false
ActiveRecord::Base.primary_key_prefix_type = :table_name_with_underscore
ActiveRecord::Base.table_name_prefix = 'acms_'
ActiveRecord::Base.pluralize_table_names = false

module AcmsRuby
  class Config
    def initialize(text)
      @php_str = text
      parse
    end

    def database_host
      @data[:DB_HOST]
    end
    def database_name
      @data[:DB_NAME]
    end
    def database_user
      @data[:DB_USER]
    end
    def database_password
      @data[:DB_PASS]
    end
    def database_port
      @data[:DB_PORT]
    end

    private
    def parse
      @data = {}
      @php_str.each_line do |line|
        if line =~ /define\(.*\'(.+)\'.+\'(.+)\'.*\)/
          @data[$1.to_sym] = $2
        end
      end
    end
  end
end
