# -*- coding: utf-8 -*-
module AcmsRuby
  class Field < AcmsRuby::ARBase
    self.primary_keys = [:field_key, :field_search, :field_eid, :field_cid, :field_uid, :field_bid]

    belongs_to :current_blog, class_name: 'Blog', foreign_key: :field_blog_id, primary_key: :blog_id
    belongs_to :entry, class_name: 'Entry', foreign_key: :field_eid, primary_key: :entry_id
    belongs_to :category, class_name: 'Category', foreign_key: :field_cid, primary_key: :category_id
    belongs_to :user, class_name: 'User', foreign_key: :field_uid, primary_key: :user_id
    belongs_to :blog, class_name: 'Blog', foreign_key: :field_bid, primary_key: :blog_id

    create_methods ['key','value','eid','cid','uid','bid'], 'field'
  end
end
