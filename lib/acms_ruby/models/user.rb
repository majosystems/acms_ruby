# -*- coding: utf-8 -*-
module AcmsRuby
  class User < ARBase
    belongs_to :blog, class_name: 'Blog', foreign_key: :user_blog_id

    has_many :entries, class_name: 'Entry', foreign_key: :entry_user_id
    has_many :fields, class_name: 'Field', foreign_key: :field_uid

    create_methods ['code','status','name','mail','auth','login_anywhere','login_expire','login_datetime','updated_datetime','generated_datetime'], 'user'
  end
end
