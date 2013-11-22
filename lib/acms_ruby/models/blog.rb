# -*- coding: utf-8 -*-
module AcmsRuby
  class Blog < AcmsRuby::ActiveRecord::Base
    scope :closes, -> { where(blog_status: :close) }
    scope :opens, -> { where(blog_status: :open) }
  end
end
