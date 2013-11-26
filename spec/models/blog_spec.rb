# -*- coding: utf-8 -*-

require 'spec_helper'

describe AcmsRuby::Blog do
  before do
    @blog_a = FactoryGirl.create(:blog, blog_name: 'blog A', blog_code: 'blog_a')
    @blog_b = FactoryGirl.create(:blog, blog_name: 'blog B', blog_code: 'blog_b', parent: @blog_a)
    @blog_c = FactoryGirl.create(:blog, blog_name: 'blog C', blog_code: 'blog_c', parent: @blog_b)
    @categories = []
    10.times do |i|
      @categories.push FactoryGirl.create(:category,
        category_name: "category a #{i}",
        category_code: "category_a_#{i}",
        blog: @blog_a,
        category_scope: [2,4,6].include?(i) ? 'global' : 'local'
      )
    end
    5.times do |i|
      @categories.push FactoryGirl.create(:category,
        category_name: "category b #{i}",
        category_code: "category_b_#{i}",
        blog: @blog_b,
        category_scope: [3].include?(i) ? 'global' : 'local'
      )
    end
    1.times do |i|
      @categories.push FactoryGirl.create(:category,
        category_name: "category c #{i}",
        category_code: "category_c_#{i}",
        blog: @blog_c
      )
    end
  end

  it 'ブログに所属する「全てのカテゴリ」の数を取得できる' do
    expect(@blog_a.categories.count).to eq(10)
    expect(@blog_b.categories.count).to eq(8)
    expect(@blog_c.categories.count).to eq(5)
  end

  it 'ブログに所属する「親所属のカテゴリ」の数を取得できる' do
    expect(@blog_a.global_categories.count).to eq(3)
    expect(@blog_b.global_categories.count).to eq(4)
    expect(@blog_c.global_categories.count).to eq(4)
  end

  it 'ブログに所属する「オリジナルカテゴリ」の数を取得できる' do
    expect(@blog_a.origin_categories.count).to eq(10)
    expect(@blog_b.origin_categories.count).to eq(5)
    expect(@blog_c.origin_categories.count).to eq(1)
  end
end
