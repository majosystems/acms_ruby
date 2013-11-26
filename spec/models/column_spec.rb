# -*- coding: utf-8 -*-

require 'spec_helper'

describe AcmsRuby::Column do
  before do
    @column = FactoryGirl.create(:column, column_type: 'text', column_field_1: "test text")
  end

  it '#text テキストタイプならテキストが取得でききる' do
    expect(@column.text).to eq('test text')
  end
end
