# -*- coding: utf-8 -*-
require "active_record"
require "composite_primary_keys"

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

    def self.next_id
      self.all.map(&:id).max + 1
    end

    def next_id
      self.class.next_id
    end
  end
end
