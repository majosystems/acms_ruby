# -*- coding: utf-8 -*-

require 'spec_helper'

describe AcmsRuby::Blog do
  it '#name' do
    @blog = FactoryGirl.build(:blog)
    expect(@blog.name).to eq('blog A')
  end
end
