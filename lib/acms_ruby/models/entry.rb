# -*- coding: utf-8 -*-
module AcmsRuby
  class Entry < AcmsRuby::ARBase
    include AcmsRuby::FieldSelectMethods

    scope :closes, -> { where(entry_status: :close) }
    scope :opens, -> { where(entry_status: :open) }
    scope :drafts, -> { where(entry_status: :draft) }

    belongs_to :user, class_name: 'User', foreign_key: :entry_user_id
    belongs_to :last_update_user, class_name: 'User', foreign_key: :entry_last_update_user_id
    belongs_to :category, class_name: 'Category', foreign_key: :entry_category_id
    belongs_to :blog, class_name: 'Blog', foreign_key: :entry_blog_id
    belongs_to :form, class_name: 'Form', foreign_key: :entry_form_id

    has_many :fields, class_name: 'Field', foreign_key: :field_eid
    has_many :columns, class_name: 'Column', foreign_key: :column_entry_id

    create_methods ['code','status','title','link','datetime','start_datetime','end_datetime','posted_datetime','updated_datetime'], 'entry'

    def full_text
      columns.texts.map do |text|
        text.field_1
      end.join("\n")
    end

  end
end
