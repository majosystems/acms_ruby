# -*- coding: utf-8 -*-
module AcmsRuby
  class LogForm < AcmsRuby::ARBase
    belongs_to :blog, class_name: 'Blog', foreign_key: :log_form_blog_id
    belongs_to :entry, class_name: 'Entry', foreign_key: :log_form_entry_id
    belongs_to :form, class_name: 'Form', foreign_key: :log_form_form_id

    create_methods ['datetime','remote_addr','user_agent','mail_to','mail_subject','mail_subject_admin','mail_body','mail_body_admin','data','form_id','entry_id','blog_id'], 'log_form'

    def fields
      PHP.unserialize(data)[:_aryField]
    end
  end
end
