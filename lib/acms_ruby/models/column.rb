# -*- coding: utf-8 -*-
module AcmsRuby
  class Column < AcmsRuby::ARBase
    include AcmsRuby::FieldSelectMethods

    scope :texts, -> { where(column_type: :text) }

    belongs_to :entry, class_name: 'Entry', foreign_key: :column_entry_id
    belongs_to :blog, class_name: 'Blog', foreign_key: :column_blog_id

    create_methods ['sort','align','type','attr','group','size','field_1','field_2','field_3','field_4','field_5','field_6','field_7','field_8'], 'column'
  end
end
