# -*- coding: utf-8 -*-
module AcmsRuby
  class Category < AcmsRuby::ARBase
    scope :closes, -> { where(entry_status: :close) }
    scope :opens, -> { where(entry_status: :open) }

    belongs_to :parent, class_name: 'Category', foreign_key: :category_parent, primary_key: :category_id

    has_many :categories, class_name: 'Category', foreign_key: :category_parent, primary_key: :category_id
    has_many :entries, class_name: 'Entry', foreign_key: :entry_category_id, primary_key: :category_id
    has_many :fields, class_name: 'Field', foreign_key: :field_cid, primary_key: :category_id

    create_methods ['code','status','name'], 'category'
  end
end
