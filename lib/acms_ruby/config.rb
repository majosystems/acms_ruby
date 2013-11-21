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
