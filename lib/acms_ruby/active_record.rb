# -*- coding: utf-8 -*-
require "active_record"

module AcmsRuby
  class ARBase < ActiveRecord::Base
    self.abstract_class = true

    def self.create_methods(names, prefix)
      names.each do |name|
        define_method(name) do
          send("#{prefix}_#{name}")
        end
        define_method(name+"=") do |v|
          send("#{prefix}_#{name}=", v)
        end
      end
    end
  end
end
