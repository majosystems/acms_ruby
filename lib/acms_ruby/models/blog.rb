# -*- coding: utf-8 -*-
module AcmsRuby
  class Blog < AcmsRuby::ARBase
    include AcmsRuby::FieldSelectMethods

    scope :closes, -> { where(blog_status: :close) }
    scope :opens, -> { where(blog_status: :open) }

    belongs_to :parent, class_name: 'Blog', foreign_key: :blog_parent

    has_many :origin_categories, class_name: 'Category', foreign_key: :category_blog_id
    has_many :entries, class_name: 'Entry', foreign_key: :entry_blog_id
    has_many :fields, class_name: 'Field', foreign_key: :field_bid
    has_many :users, class_name: 'User', foreign_key: :user_blog_id
    has_many :all_blog_fields, class_name: 'Field', foreign_key: :field_blog_id

    create_methods ['code','status','name','domain','generated_datetime'], 'blog'

    def categories
      return origin_categories unless parent
      parent.global_categories + origin_categories
    end

    def global_categories
      g_cates = origin_categories.where category_scope: :global
      return g_cates unless parent
      parent.global_categories + g_cates
    end
  end
end
