
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
