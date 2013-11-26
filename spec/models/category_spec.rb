# -*- coding: utf-8 -*-

require 'spec_helper'

describe AcmsRuby::Category do
  it '#name' do
    @category = FactoryGirl.create(:category)
    expect(@category.name).to eq('category name')
  end
end
