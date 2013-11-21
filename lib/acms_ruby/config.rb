module AcmsRuby
  class Config
    attr_accessor :port, :targets

    def initialize
      @targets = {}
      @port = 3000
    end

    def [](name)
      @targets[name]
    end
  end
end
