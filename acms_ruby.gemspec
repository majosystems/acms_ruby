# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acms_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "acms_ruby"
  spec.version       = AcmsRuby::VERSION
  spec.authors       = ["takashi.akagi"]
  spec.email         = ["nisyu@mac.com"]
  spec.description   = %q{a-blog cms をrubyで操作したい}
  spec.summary       = %q{acms_ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "activerecord"
  spec.add_dependency "composite_primary_keys"
  spec.add_dependency "pry"
  spec.add_dependency "factory_girl"
  spec.add_dependency "mysql2"
end
