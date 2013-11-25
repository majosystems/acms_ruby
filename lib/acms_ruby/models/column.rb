# -*- coding: utf-8 -*-
module AcmsRuby
  class Column < AcmsRuby::ARBase
    include AcmsRuby::FieldSelectMethods

    default_scope -> { order(:column_sort) }
    scope :texts, -> { where(column_type: :text) }

    belongs_to :entry, class_name: 'Entry', foreign_key: :column_entry_id
    belongs_to :blog, class_name: 'Blog', foreign_key: :column_blog_id

    create_methods ['sort','align','type','attr','group','size','field_1','field_2','field_3','field_4','field_5','field_6','field_7','field_8'], 'column'

    def text
      return field_1 if type == 'text'
      nil
    end

    def html
      case type
      when 'text'
        "<#{field_2}>#{text}</#{field_2}>"
      when 'image'
        "<img src=\"#{field_2}\" />"
      else
        nil
      end
    end

  end
end
