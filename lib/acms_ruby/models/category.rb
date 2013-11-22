# -*- coding: utf-8 -*-
module AcmsRuby
  class Category < AcmsRuby::ARBase
    scope :closes, -> { where(entry_status: :close) }
    scope :opens, -> { where(entry_status: :open) }
  end
end
