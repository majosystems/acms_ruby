# -*- coding: utf-8 -*-
module AcmsRuby
  class Blog < AcmsRuby::ARBase
    scope :closes, -> { where(blog_status: :close) }
    scope :opens, -> { where(blog_status: :open) }

    belongs_to :parent, class_name: 'Blog', foreign_key: :blog_parent, primary_key: :blog_id
    has_many :entries, class_name: 'Entry', foreign_key: :entry_blog_id, primary_key: :blog_id

    create_methods ['code','status','name','domain','generated_datetime'], 'blog'
  end
end
