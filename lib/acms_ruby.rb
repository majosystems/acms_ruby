require "acms_ruby/version"
require "acms_ruby/config"

module AcmsRuby
  extend self

  def run(*argv)
    p config_file
  end

  private
  def config_file
    Pathname.new("private/config.system.yaml").expand_path.to_s
  end
end
