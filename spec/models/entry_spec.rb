# -*- coding: utf-8 -*-

require 'spec_helper'

describe AcmsRuby::Entry do
  before do
    @entry = FactoryGirl.create(:entry, entry_title: 'test entry')
    @column = FactoryGirl.create(:column, column_type: 'text', column_field_1: "hogehoge", column_field_2: 'p', entry: @entry, column_sort: 1)
    @column = FactoryGirl.create(:column, column_type: 'text', column_field_1: "fugafuga", column_field_2: 'p', entry: @entry, column_sort: 2)
  end

  it '#full_text 所属かカラムから生成されるテキストを返す' do
    expect(@entry.full_text).to eq("hogehoge\nfugafuga")
  end
end
