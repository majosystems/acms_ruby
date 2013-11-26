# -*- coding: utf-8 -*-

require 'spec_helper'

describe AcmsRuby::Column do
  before do
    sep = AcmsRuby::Column::ACMS_UNIT_TEXT_DELIMITER
    @column = FactoryGirl.create(:column, column_type: 'text', column_field_1: "test text", column_field_2: 'p')
    @column_multiline = FactoryGirl.create(:column, column_type: 'text', column_field_1: "test 1 line"+sep+"test 2 line"+sep+"test 3 line")
  end

  it '#text テキストタイプならテキストが取得でききる' do
    expect(@column.text).to eq('test text')
  end

  it '#texts テキストが複数のものを配列で返す' do
    expect(@column_multiline.text).to eq('test 1 line')
    expect(@column_multiline.text(1)).to eq('test 2 line')
    expect(@column_multiline.texts.size).to eq(3)
  end

  it '#html テキストを指定のHTMLに変換して返す' do
    expect(@column.html).to eq('<p>test text</p>')
  end
end
