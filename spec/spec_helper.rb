# encoding: utf-8

require 'rubygems'
require 'acms_ruby'
require 'factory_girl'
require 'factories'
require 'rspec'

config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.establish_connection(config['test'])
