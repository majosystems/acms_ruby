# AcmsRuby

a-blog cms のデータを ActiveRecord オブジェクトとして操作したい人へ

## Installation

Add this line to your application's Gemfile:

    gem 'acms_ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acms_ruby

## Usage

操作したい a-blog cms がインストールされているディレクトリに移動して、以下のコマンドを実行

    $ acms

local環境とかでソケットの指定がなくてつながらない時は環境変数で指定してください（例）

    export ACMS_SOCKET='/Applications/MAMP/tmp/mysql/mysql.sock'

操作例
ユーザの情報を確認

    > user = User.find 1   # ユーザーID 1 のユーザ情報取得
    > user.name            # ユーザの名前

ユーザの情報を更新

    > user.name = "new name"  # ユーザの名前を設定
    > user.save!              # DBに保存

ブログの情報からエントリー情報取得までの例

    > blog = Blog.find 1       # ブログID 1 のブログ取得
    > blog.users               # ブログの所属ユーザ
    > cates = blog.categories  # カテゴリのリストを取得
    > category = cates[2]      # 3番目のカテゴリ取得
    > category.name            # カテゴリの名前を確認
    > category.entries.each do |entry| print "#{category.name},#{entry.id},#{entry.title},#{entry.user.name}\n" end
      # ↑カテゴリ内のエントリーを、カテゴリ名,エントリID,エントリタイトル,ユーザー名 のCSV形式で表示

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
