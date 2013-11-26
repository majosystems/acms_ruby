
FactoryGirl.define do
  sequence(:sequence_b_id)

  factory :blog, class: AcmsRuby::Blog do
    blog_id { FactoryGirl.generate(:sequence_b_id) }
    blog_code "blog_code"
    blog_name "blog name"
    blog_parent 0
    blog_sort 0
    blog_left 1
    blog_right 1
    blog_domain 'localhost'
  end
end

FactoryGirl.define do
  sequence(:sequence_c_id)

  factory :category, class: AcmsRuby::Category do
    category_id { FactoryGirl.generate(:sequence_c_id) }
    category_code "category_code"
    category_name "category name"
    category_scope "local"
    category_parent 0
    category_sort 1
    category_left 1
    category_right 1
    category_blog_id 1
  end
end

FactoryGirl.define do
  sequence(:sequence_col_id)

  factory :column, class: AcmsRuby::Column do
    column_id { FactoryGirl.generate(:sequence_col_id) }
    column_sort 1
    column_align "center"
    column_type "text"
    column_attr ""
    column_group ""
    column_size ""
    column_field_1 "hogehoge"
    column_field_2 ""
    column_field_3 ""
    column_field_4 ""
    column_field_5 ""
    column_field_6 ""
    column_field_7 ""
    column_field_8 ""
    column_entry_id 1
    column_blog_id 1
  end
end

FactoryGirl.define do
  sequence(:sequence_e_id)

  factory :entry, class: AcmsRuby::Entry do
    entry_id { FactoryGirl.generate(:sequence_e_id) }
    entry_code "entry_code"
    entry_form_status ""
    entry_sort 1
    entry_user_sort 1
    entry_category_sort 1
    entry_link ""
    entry_current_rev_id 0
    entry_last_update_user_id 0
    entry_hash ""
    entry_user_id 1
    entry_form_id 0
    entry_blog_id 1
  end
end


