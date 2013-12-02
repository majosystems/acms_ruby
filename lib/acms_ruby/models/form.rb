# -*- coding: utf-8 -*-
module AcmsRuby
  class Form < AcmsRuby::ARBase
    belongs_to :blog, class_name: 'Blog', foreign_key: :form_blog_id

    has_many :entries, class_name: 'Entry', foreign_key: :entry_form_id
    has_many :logs, class_name: 'LogForm', foreign_key: :log_form_form_id

    create_methods ['code','name'], 'form'
  end
end
