# -*- coding: utf-8 -*-
module AcmsRuby
  class Entry < ActiveRecord::Base
    self.table_name = 'acms_entry'
    belongs_to :user, foreign_key: :entry_user_id, primary_key: :user_id
  end
end
