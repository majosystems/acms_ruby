# -*- coding: utf-8 -*-
module AcmsRuby
  class Entry < AcmsRuby::ActiveRecord::Base
    scope :closes, -> { where(entry_status: :close) }
    scope :opens, -> { where(entry_status: :open) }
    scope :drafts, -> { where(entry_status: :draft) }

    belongs_to :user, class_name: 'User', foreign_key: :entry_user_id, primary_key: :user_id
    belongs_to :last_update_user, class_name: 'User', foreign_key: :entry_last_update_user_id, primary_key: :user_id

    ['code','status','title','link','datetime','start_datetime','end_datetime','posted_datetime','updated_datetime']
    def title
      entry_title
    end
    def title=(v)
      entry_title = v
    end
  end
end
