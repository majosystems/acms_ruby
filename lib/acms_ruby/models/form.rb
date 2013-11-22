# -*- coding: utf-8 -*-
module AcmsRuby
  class Form < AcmsRuby::ActiveRecord::Base
    scope :closes, -> { where(entry_status: :close) }
    scope :opens, -> { where(entry_status: :open) }
    scope :drafts, -> { where(entry_status: :draft) }

    belongs_to :user, class_name: 'User', foreign_key: :entry_user_id, primary_key: :user_id
    belongs_to :user, class_name: 'User', foreign_key: :entry_user_id, primary_key: :user_id
  end
end
