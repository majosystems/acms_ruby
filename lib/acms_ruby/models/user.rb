# -*- coding: utf-8 -*-
module AcmsRuby
  class User < AcmsRuby::ActiveRecord::Base
    has_many :entries, class_name: 'Entry', foreign_key: :entry_user_id, primary_key: :user_id
  end
end
