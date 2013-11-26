# -*- coding: utf-8 -*-

require 'spec_helper'

describe AcmsRuby::Category do
  it 'nameでカテゴリ名が取得できる' do
    @category = FactoryGirl.create(:category, category_name: 'test name')
    expect(@category.name).to eq('test name')
  end
end
